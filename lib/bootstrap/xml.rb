module FHIR
  module Xml

    #
    #  This module includes methods to serialize or deserialize FHIR resources to and from XML.
    #

    def to_xml
      hash = {}
      hash = self.to_hash
      hash.delete('resourceType')
      doc = Nokogiri::XML::Document.new
      doc.encoding = 'utf-8'
      doc.root = hash_to_xml_node(self.resourceType,hash,doc)
      doc.root.default_namespace = 'http://hl7.org/fhir'
      doc.to_xml
    end

    # Hash keys are ordered in Ruby 1.9 and later, so we can rely on their order
    # to be the correct order for the XML serialization.
    def hash_to_xml_node(name,hash,doc)
      node = Nokogiri::XML::Node.new(name,doc)
      hash.each do |key,value|
        if value.is_a?(Hash)
          node.add_child(hash_to_xml_node(key,value,doc))
        elsif value.is_a?(Array)
          value.each do |v|
            if v.is_a?(Hash)
              node.add_child(hash_to_xml_node(key,v,doc))
            else
              child = Nokogiri::XML::Node.new(key,doc)
              child.set_attribute('value',v)
              node.add_child(child)
            end
          end
        else
          child = Nokogiri::XML::Node.new(key,doc)
          if(name=='text' && key=='div')
            child.set_attribute('xmlns','http://www.w3.org/1999/xhtml')
            html = value.strip
            html = html[5..-4] if html.start_with?('<div>') && html.end_with?('</div>')
            child.inner_html = html
          else
            child.set_attribute('value',value)
          end
          node.add_child(child)
        end
      end
      node
    end

    def self.from_xml(xml)
      doc = Nokogiri::XML(xml)
      doc.root.add_namespace_definition('f', 'http://hl7.org/fhir')
      doc.root.add_namespace_definition('x', 'http://www.w3.org/1999/xhtml')
      hash = xml_node_to_hash(doc.root)

      resource = nil
      begin
        resourceType = doc.root.name
        klass = Module.const_get("FHIR::#{resourceType}")
        resource = klass.new
        resource.from_hash(hash)
      rescue Exception => e
        binding.pry
        resource = nil
      end
      resource
    end

    def self.xml_node_to_hash(node)
      hash = {}
      node.children.each do |child|
        next if [Nokogiri::XML::Text].include?(child.class)

        key = child.name
        if node.name=='text' && key=='div'
          hash[key] = child.inner_html
        else
          value = child.get_attribute('value')
          if value.nil? && !child.children.empty?
            value = xml_node_to_hash(child)
          end

          if hash[key]
            hash[key] = [ hash[key] ] unless hash[key].is_a?(Array)
            hash[key] << value
          else
            hash[key] = value
          end
        end

       end
      hash
    end

    private :hash_to_xml_node
    private_class_method :xml_node_to_hash

  end
end
