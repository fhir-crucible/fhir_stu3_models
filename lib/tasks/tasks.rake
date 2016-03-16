namespace :fhir do

  desc 'console'
  task :console, [] do |t, args|
    binding.pry
  end

  desc 'generate fhir models'
  task :generate, [] do |t, args|
    # createa a generator and load the definitions
    generator = FHIR::Boot::Generator.new
    # 1. generate the primitive data types
    generator.generate_primitives
    # 2. generate the complex data types
    generator.generate_types
    # 3. generate the base Resources
    generator.generate_resources
    # 4. generate extensions?

    # 5. generate profiles?

  end

  desc 'preprocess definitions'
  task :preprocess, [] do |t, args|
    defns = File.expand_path '../../definitions',File.dirname(File.absolute_path(__FILE__))
    Dir.glob(File.join(defns,'structures','*.json')).each do |file|
      FHIR::Boot::Preprocess.pre_process_bundle(file)
    end
    Dir.glob(File.join(defns,'valuesets','*.json')).each do |file|
      FHIR::Boot::Preprocess.pre_process_bundle(file)
    end
    Dir.glob(File.join(defns,'schema','*.xsd')).each do |file|
      FHIR::Boot::Preprocess.pre_process_schema(file)
    end    
  end

end
