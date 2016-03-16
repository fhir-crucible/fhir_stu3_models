module FHIR
  module Hashable

    def to_hash
      hash = Hash.new
      self.instance_variables.each do |v|
        key = v.to_s[1..-1] # convert the symbol to a string and remove the leading '@' character
        hash[key] = self.instance_variable_get(v)
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
      hash.each do |k,v|
        self.instance_variable_set("@#{k}",v) rescue nil
      end
      self
    end

  end
end
