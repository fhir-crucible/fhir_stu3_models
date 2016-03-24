module FHIR
  module Hashable

    def to_hash
      hash = Hash.new
      self.class::METADATA.each do |key,value|
        hash[key] = self.instance_variable_get("@#{key}")
        if hash[key].respond_to?(:to_hash)
          hash[key] = hash[key].to_hash 
        elsif hash[key].is_a? Array
          hash[key] = Array.new(hash[key]) # copy the array
          hash[key].each_with_index do |item,index|
            hash[key][index] = item.to_hash if item.respond_to?(:to_hash)
          end
        end
      end
      hash.keep_if do |key,value|
        !value.nil? && (  (value.is_a?(Hash) && !value.empty?) || 
                          (value.is_a?(Array) && !value.empty?) || 
                          (!value.is_a?(Hash) && !value.is_a?(Array))
                       )
      end
      hash
    end

    def from_hash(hash)
      # clear the existing variables
      self.class::METADATA.each do |key,value|
        self.instance_variable_set("@#{key}",nil)
      end
      # set the variables to the hash values
      hash.each do |key,value|
        meta = self.class::METADATA[key]
        if !meta.nil?
          self.instance_variable_set("@#{key}",value) rescue nil
          # inflate they value if it isn't a primitive
          klass = Module.const_get("FHIR::#{meta['type']}") rescue nil
          if !klass.nil? && !value.nil?
            # handle arrays
            if value.is_a?(Array)
              value.map! do |child|
                obj = child
                begin
                  obj = klass.new
                  obj.from_hash(child)
                rescue Exception => e
                  binding.pry
                end
                obj
              end
            else
              begin
                obj = klass.new
                obj.from_hash(value)
                value = obj
              rescue Exception => e
                binding.pry
              end
            end
            self.instance_variable_set("@#{key}",value)
          elsif !FHIR::PRIMITIVES.include?(meta['type']) && meta['type']!='xhtml'
            binding.pry
          end # !klass && !nil?
        end # !meta.nil?
      end # hash loop
    end
    self
  end
end
