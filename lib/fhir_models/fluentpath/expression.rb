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

    def clone
      clone_tree = @tree.map { |x| x.clone rescue x }
      FluentPath::Expression.new(clone_tree)
    end
  end
end
