module FluentPath

  @@context = Hash.new

  # This is the entry point to using the FluentPath class
  def self.evaluate(expression,hash)
    @@context = hash
    tree = FluentPath.parse(expression)
    puts "TREE: #{tree}"
    eval(tree,hash)
  end

  # Get a value from a hash, with some special handling of
  # self references
  def self.get(key,hash)
    return @@context if ['$context','$resource'].include?(key)
    return nil if !hash.is_a?(Hash)
    return key.gsub!(/\A\'|\'\Z/,'') if key.start_with?("'") && key.end_with?("'")
    key.gsub!(/\A"|"\Z/,'') # remove quotes around path if they exist
    return hash if hash['resourceType']==key
    hash[key]
  end

  # Convert nils and empty Arrays to false
  # Everything else is true.
  def self.convertToBoolean(value)
    return false if value.nil?
    return false if value.is_a?(Array) && value.empty?
    return false if value==false
    return true
  end

  # evaluate a parsed expression given some context data
  def self.eval(tree,data)
    tree = tree.tree if tree.is_a?(FluentPath::Expression)
    # --------------- OPERATOR PRECEDENCE ------------------
    #01 . (path/function invocation)
    #02 [] (indexer)
    #03 unary + and -
    #04: *, /, div, mod
    #05: +, -,
    #06: |
    #07: >, <, >=, <=
    #08: is, as
    #09: =, ~, !=, !~
    #10: in, contains
    #11: and 
    #12: xor, or
    #13: implies

    # evaluate all the data at this level
    size = -1
    while(tree.length!=size)
      puts "DATA: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node,index|
        if node.is_a?(String)
          if previous_node.is_a?(Hash)
            tree[index] = get(node,previous_node)
            tree[previous_index] = nil if !previous_index.nil?
          else
            tree[index] = get(node,data)
          end
          puts "====> #{tree}"
        end
        previous_index = index
        previous_node = tree[index]
      end
      tree.compact!
    end
    puts "DATA: #{tree}"

    # evaluate all the functions at this level
    functions = [:all,:not,:empty,:exists,:where,:select,:startsWith,:distinct]
    size = -1
    while(tree.length!=size)
      puts "FUNC: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node,index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = eval(previous_node,data) if previous_node.is_a?(FluentPath::Expression)
          case node
          when :all
            if previous_node.is_a?(Array)
              result = true
              previous_node.each{|item| result = (result && convertToBoolean(item))}
              tree[index] = result
              tree[previous_index] = nil if !previous_index.nil?
            else
              tree[index] = convertToBoolean(previous_node)
              tree[previous_index] = nil if !previous_index.nil?              
            end
          when :not
            tree[index] = !convertToBoolean(previous_node)
            tree[previous_index] = nil if !previous_index.nil?
          when :empty
            tree[index] = (previous_node.empty? rescue previous_node.nil?)
            tree[previous_index] = nil if !previous_index.nil?
          when :exists
            tree[index] = !previous_node.nil?
            tree[previous_index] = nil if !previous_index.nil?            
          when :distinct
            tree[index] = (previous_node.uniq rescue previous_node)
            tree[previous_index] = nil if !previous_index.nil?
          when :where
            # the previous node should be data (as Array or Hash)
            # the next node should be a block or subexpression (as FluentPath::Expression)
            block = tree[index+1]
            if block.is_a?(FluentPath::Expression)
              tree[index+1] = nil
            else
              raise "Where function requires a block."
            end
            if previous_node.is_a?(Array)
              previous_node.keep_if do |item|
                sub = eval(block,item)
                convertToBoolean(sub)
              end
              tree[index] = previous_node
              tree[previous_index] = nil if !previous_index.nil?
            elsif previous_node.is_a?(Hash)
              sub = eval(block,previous_node)
              if convertToBoolean(sub)
                tree[index] = previous_node
                tree[previous_index] = nil if !previous_index.nil?
              else
                tree[index] = {}
                tree[previous_index] = nil if !previous_index.nil?                
              end
            else
              raise "Where function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :select
            # select is equivalent to ruby Array.map!
            # the previous node should be data (as Array or Hash)
            # the next node should be a block or subexpression (as FluentPath::Expression)
            block = tree[index+1]
            if block.is_a?(FluentPath::Expression)
              tree[index+1] = nil
            else
              raise "Select function requires a block."
            end
            if previous_node.is_a?(Array)
              previous_node.map! do |item|
                eval(block,item)
              end
              tree[index] = previous_node
              tree[previous_index] = nil if !previous_index.nil?
            elsif previous_node.is_a?(Hash)
              tree[index] = eval(block,previous_node)
              tree[previous_index] = nil if !previous_index.nil?
            else
              raise "Select function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :startsWith
            # the previous node should be a data (as String)
            # the next node should be a block or subexpression (as FluentPath::Expression)
            block = tree[index+1]
            if block.is_a?(FluentPath::Expression)
              tree[index+1] = nil
            else
              raise "StartsWith function requires a block."
            end
            if previous_node.is_a?(String)
              puts "Evaling StartsWith Block...."
              prefix = eval(block,data)
              tree[index] = previous_node.start_with?(prefix) rescue false
              tree[previous_index] = nil if !previous_index.nil?
            else
              raise "StartsWith function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break            
          else
            raise "Function not implemented: #{node}"
          end
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end

    # evaluate all mult/div

    # evaluate all add/sub

    # evaluate all equality tests
    functions = [:"="]
    size = -1
    while(tree.length!=size)
      puts "EQ: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node,index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = eval(previous_node,data) if previous_node.is_a?(FluentPath::Expression)
          tree[index+1] = eval(tree[index+1],data) if tree[index+1].is_a?(FluentPath::Expression)
          left = previous_node
          right = tree[index+1]
          case node
          when :"="
            tree[index] = (left==right)
          else
            raise "Equality operator not implemented: #{node}"
          end
          tree[previous_index] = nil
          tree[index+1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    puts "EQ: #{tree}"

    # evaluate all logical tests
    functions = [:and,:or]
    size = -1
    while(tree.length!=size)
      puts "LOGIC: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node,index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = eval(previous_node,data) if previous_node.is_a?(FluentPath::Expression)
          tree[index+1] = eval(tree[index+1],data) if tree[index+1].is_a?(FluentPath::Expression)
          left = convertToBoolean(previous_node)
          right = convertToBoolean(tree[index+1])
          case node
          when :and
            tree[index] = (left&&right)
          when :or
            tree[index] = (left||right)
          else
            raise "Logical operator not implemented: #{node}"
          end
          tree[previous_index] = nil
          tree[index+1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    puts "LOGIC: #{tree}"    

    # check for symbols
    tree.each do |node|
      raise "Unhandled reserved symbol: #{node}" if node.is_a?(Symbol)
    end

    puts "OUT: #{tree}"

    tree.first
  end

end
