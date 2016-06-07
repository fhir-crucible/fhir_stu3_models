module FluentPath
  class Expression
        
    attr_accessor :tree

    def initialize(tree)
      @tree = tree
    end

    def to_s
      "#{@tree}"
    end

    def inspect
      to_s
    end
    
  end
end