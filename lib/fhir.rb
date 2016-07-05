module FHIR
  def self.logger
    @logger || default_logger
  end

  def self.logger=(logger)
    @logger = logger
  end

  def self.default_logger
    @default_logger ||= Logger.new("fhir_models.log", 10, 1024000)
  end

  def self.from_contents(contents)
    doc = Nokogiri::XML(contents)
    if doc.errors.empty?
      FHIR::Xml.from_xml(contents)
    else
      FHIR::Json.from_json(contents)
    end
  end

end
