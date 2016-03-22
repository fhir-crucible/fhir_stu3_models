module FHIR
  module Boot
    class Template
      include FHIR::Hashable

      attr_accessor :name
      attr_accessor :constants
      attr_accessor :fields
      attr_accessor :templates
      attr_accessor :top_level

      def initialize(name=['Template'],top_level=false)
        @name = name
        @constants = {}
        @fields = []
        @templates = []
        @top_level = top_level
      end

      def to_s(offset=0)
        # create an array of Strings, one per line
        s = []
        # TODO insert copyright statement
        # always declare the FHIR module
        s << 'module FHIR' if @top_level

        @name.each_with_index do |name, index|
          space = indent(index+1,offset)
          type = 'module'
          type = 'class' if index==@name.length-1
          s << "#{space}#{type} #{name}"
        end

        # include modules
        space = indent(@name.length+1,offset)
        s << "#{space}include Hashable" if(@name.length > 0)
        s << ''

        # add mandatory METADATA constant
        metadata = {}
        @fields.each do |field|
          metadata[field.name] = field.to_hash
          metadata[field.name].delete('name')
        end
        @constants['METADATA'] = metadata if !metadata.empty?

        # add constants
        @constants.each do |constant,value|
          if value.is_a?(Hash)
            s << "#{space}#{constant.upcase} = {"
            value.each do |k,v|
              s << "#{space}  '#{k}' => #{v},"
              # Replace wildcard string with Infinity constant
              s[-1].gsub!('"max"=>"*"','"max"=>Float::INFINITY')
              s[-1].gsub!('"','\'')
            end
            s[-1] = s[-1][0..-2] # remove the trailing comma
            s << "#{space}}"
          else
            s << "#{space}#{constant.upcase} = #{value}"
          end
        end
        s << ''

        # add internal nested classes
        @templates.each do |template|
          s << template.to_s(space.length-2)
          s << ''          
        end

        # calculate the longest field name for whitespace layout
        max_name_size = 0
        @fields.each{|f| max_name_size=f.name.length if(f.name.length > max_name_size)}
        max_name_size += 1

        # declare attributes
        @fields.each do |field|
          s << "#{space}attr_accessor :"
          s[-1] << ("%-#{max_name_size}s" % "#{field.name}")
          # add comment after field declaration
          s[-1] << "# #{field.min}-#{field.max} "
          s[-1] << "[ " if(field.max.to_i > 1 || field.max=='*')
          s[-1] << field.type
          if field.type=='Reference'
            s[-1] << "(#{ field.type_profiles.map{|p|p.split('/').last}.join('|') })"
          end
          s[-1] << " ]" if(field.max.to_i > 1 || field.max=='*')          
        end

        # close all the class and module declarations
        (0..@name.length-1).reverse_each do |index|
          space = indent(index+1,offset)
          s << "#{space}end"          
        end
        s << 'end' if @top_level
        s.join("\n")
      end

      def indent(level=0,offset)
        ' '*(offset) + '  '*(level)
      end

    end
  end
end
