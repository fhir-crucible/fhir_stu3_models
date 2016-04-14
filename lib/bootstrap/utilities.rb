module FHIR
  module Utilities

    def self.included(base)
      base.class_exec do
        def initialize(hash={})
          self.from_hash(hash)
          self.class::METADATA.each do |key, value| 
            if value['max'] > 1 && self.instance_variable_get("@#{key}").nil?
              self.instance_variable_set("@#{key}".to_sym, [])
            end
          end
        end
      end
    end

    def equals?(other, exclude=[])
      (self.class::METADATA.keys - exclude).each do |attribute|
        return false unless compare_attribute(self.instance_variable_get("@#{attribute}".to_sym), other.instance_variable_get("@#{attribute}".to_sym), exclude)
      end
      true
    end

    def compare_attribute(left, right, exclude=[])
      if left.respond_to?(:equals?) && right.respond_to?(:equals?)
        left.equals? right, exclude
      elsif left.is_a?(Array) && right.is_a?(Array) && (left.length == right.length)
        result = true
        (0...(left.length)).each {|i| result &&= compare_attribute(left[i], right[i])}
        result
      else
        left == right
      end
    end


  end
end
