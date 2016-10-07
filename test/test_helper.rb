require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'simplecov'
require 'nokogiri/diff'
require 'test/unit'
require 'pry'

require 'fhir_models'
FHIR.logger.level = Logger::INFO
