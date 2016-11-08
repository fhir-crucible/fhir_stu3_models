require 'simplecov'
SimpleCov.start

require 'nokogiri/diff'
require 'test/unit'
require 'pry'

require 'fhir_models'
FHIR.logger.level = Logger::INFO
