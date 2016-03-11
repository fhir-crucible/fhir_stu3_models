module FHIR

  def self.from_contents(contents)
    nil
    # doc = Nokogiri::XML(contents)
    # if doc.errors.empty?
    #   doc.root.add_namespace_definition('fhir', 'http://hl7.org/fhir')
    #   doc.root.add_namespace_definition('xhtml', 'http://www.w3.org/1999/xhtml')
    #   "FHIR::#{doc.at_xpath('/*').name}".constantize.from_xml(contents)
    # else
    #   "FHIR::#{JSON.parse(contents)['resourceType']}".constantize.from_fhir_json(contents)
    # end
  end

end