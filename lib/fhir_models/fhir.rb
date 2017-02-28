require 'nokogiri'
require 'logger'
module FHIR
  def self.logger
    @logger || default_logger
  end

  def self.logger=(logger)
    @logger = logger
  end

  def self.default_logger
    @default_logger ||= Logger.new(ENV['FHIR_LOGGER'] || STDOUT)
  end

  def self.from_contents(contents)
    doc = Nokogiri::XML(contents)
    if doc.errors.empty?
      FHIR::Xml.from_xml(contents)
    else
      FHIR::Json.from_json(contents)
    end
  end

  # TODO: perhaps this should validate against regexes if they are present
  def self.primitive?(datatype:, value:)
    # Remaining data types: handle special cases before checking type StructureDefinitions
    case datatype.downcase
    when 'boolean'
      value == true || value == false || value.casecmp('true').zero? || value.casecmp('false').zero?
    when 'integer'
      if value.is_a?(Integer)
        true
      elsif value.is_a?(String)
        begin
          Integer(value).is_a?(Integer)
        rescue StandardError
          false
        end
      else
        false
      end
    when 'string', 'markdown'
      value.is_a?(String)
    when 'decimal'
      begin
        Float(value).is_a?(Float)
      rescue StandardError
        false
      end
    when 'uri'
      begin
        !URI.parse(value).nil?
      rescue
        false
      end
    when 'base64binary'
      # According to RFC-4648 base64binary encoding includes digits 0-9, a-z, A-Z, =, +, /, and whitespace
      # an empty string is considered valid
      # whitespace is not significant so we strip it out before doing the regex so that we can be sure that
      # the number of characters is a multiple of 4.
      # https://tools.ietf.org/html/rfc4648
      value == '' || value.is_a?(String) && !(value.gsub(/\s/, '') =~ %r{\A[0-9a-zA-Z\+=\s/]{4}+\Z}).nil?
    when 'instant'
      regex = /\A[0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)))))\Z/
      value.is_a?(String) && !(regex =~ value).nil?
    when 'date'
      value.is_a?(Date) || value.is_a?(String) && !(value =~ /\A-?[0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1]))?)?\Z/).nil?
      # NOTE: we don't try to instantiate a Date because ruby does not natively suppport
      # partial dates, which the FHIR standard allows.
    when 'datetime'
      value.is_a?(DateTime) || value.is_a?(String) && !(value =~ /\A-?[0-9]{4}(-(0[1-9]|1[0-2])(-(0[0-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)))?)?)?\Z/).nil?
      # NOTE: we don't try to instantiate a DateTime because ruby does not natively suppport
      # partial dates, which the FHIR standard allows.
    when 'time'
      return false unless value =~ /\A([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?\Z/
      begin
        Time.parse(value).is_a?(Time)
      rescue ArgumentError
        false
      end
    when 'code'
      value.is_a?(String) && value.size >= 1 && value.size == value.rstrip.size
    when 'oid'
      false
    when 'id'
      false
    when 'xhtml'
      fragment = Nokogiri::HTML::DocumentFragment.parse(value)
      value.is_a?(String) && fragment.errors.size.zero?
    when 'unsignedint'
      if value.is_a?(Integer) && value >= 0
        true
      elsif value.is_a?(String)
        begin
          Integer(value) >= 0
        rescue StandardError
          false
        end
      else
        false
      end
    when 'positiveint'
      if value.is_a?(Integer) && value > 0
        true
      elsif value.is_a?(String)
        begin
          Integer(value) > 0
        rescue StandardError
          false
        end
      else
        false
      end
    else
      FHIR.logger.warn "Unable to check #{value} for datatype #{datatype}"
      false
    end
  end
end
