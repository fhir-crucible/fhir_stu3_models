module FHIR
  class Expansions

    attr_accessor :expansions

    def initialize    
      defns = File.expand_path '../../definitions',File.dirname(File.absolute_path(__FILE__))

      # load the types
      filename = File.join(defns,'valuesets','expansions.json')
      raw = File.open(filename,'r:UTF-8',&:read)
      @expansions = JSON.parse(raw)['entry'].map{|e|e['resource']}
    end

    def get_codes(uri)
      codes = nil
      valueset = @expansions.select{|x|x['url']==uri}.first
      if !valueset.nil?
        codes = valueset['expansion']['contains'].map{|x|x['code']} rescue nil
      end
      codes
    end

  end
end
