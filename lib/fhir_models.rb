require 'fhir_models/version'

# TODO what are these for?  Nothing seems to use them.
require 'yaml'
require 'date_time_precision'
require 'date_time_precision/format/iso8601'

Dir.chdir('lib') do
  # Need to require Hashable first
  require_relative 'fhir_models/bootstrap/hashable'
  require_relative 'fhir_models/bootstrap/json'
  Dir['fhir_models/bootstrap/*.rb'].each do |file|
    require_relative file
  end

  require_relative 'fhir_models/fhir'

  require_relative 'fhir_models/fhir/metadata'
  # require generated models
  Dir['fhir_models/fhir/**/*.rb'].each do |file|
    require_relative file
  end

  # require fluentpath code
  Dir['fhir_models/fluentpath/*.rb'].each do |file|
    require_relative file
  end

  # require fhir_ext code
  Dir['fhir_models/fhir_ext/*.rb'].each do |file|
    require_relative file
  end
end
