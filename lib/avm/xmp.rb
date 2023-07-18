module Avm
    module Xmp

        require 'open3'
        require 'exiftool_vendored'
        # return the exiftool_vendored gem excitable path.
        def self.exiftool
        Exiftool.command
        end

        def self.extract_xmp_header(filename)
        raise "Cannot find file for XMP extraction." unless File.file?(filename)
        stdin, stdout, stderr = Open3.popen3 "#{exiftool} -config #{Avm::PreFlight.avm_exiftool_config} -b -xmp #{filename}"
        data = stdout.read.gsub("\r", '')
        if data == ""
            return "<xml><rdf:RDF xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'><rdf:Description></rdf:Description></rdf:RDF></xml>"
        else
            return data
        end
        end

        

        def self.escape_for_exiftool(text)
        text.gsub('"', '\\"')
        end

        def self.clear_xmp_from_file(filename)
        `#{exiftool} -xmp:All= #{filename}`
        end

        def self.search_value(xml, schema)
        value = xml.dig("RDF", 0).dig("Description").map{|fragment| fragment.dig(schema)}.compact.flatten[0]
        unless value # search for a shorter schema
            value = xml.dig("RDF", 0).dig("Description").map{|fragment| fragment.dig(schema.split(":").last)}.compact.flatten[0]
        end
        return value
        end

        def self.read(filename)
        @xmp_doc = XmlSimple.xml_in Avm::Xmp.extract_xmp_header(filename)
        @data = {}
        Avm::Element.all.each do |element|
            if element.data_type == :text
            value = search_value(@xmp_doc, element.schema)
            @data[element.field_name] = value.kind_of?(String) ? value : ""
            end

            if element.data_type == :iptc_contact
            info = search_value(@xmp_doc, "CreatorContactInfo")
            if info.present?
                @data[element.field_name] = info.dig(element.schema) || info.dig(element.schema.split(":").last) || ""
            else
                @data[element.field_name] = ""
            end
            end

            if [:sequence, :bag].include?(element.data_type)
            @data[element.field_name] = search_value(@xmp_doc, element.schema)
            if @data[element.field_name].present?
                @data[element.field_name] = @data[element.field_name].values.flatten.first["li"].map{|v| v.kind_of?(String) ? v : ""}
            end
            end

            if element.data_type == :alternatives
            @data[element.field_name] = search_value(@xmp_doc, element.schema)
            @data[element.field_name] = @data[element.field_name].present? ? @data[element.field_name].dig("Alt", 0).dig("li", 0).dig("content") : ""
            end
        end

        ## Fix old version and compact tags
        Avm::Element.all.each do |element|
            if [:text, :iptc_contact, :alternatives].include?(element.data_type)
            @data[element.field_name] = @data[element.field_name].try(:first) if @data[element.field_name].kind_of?(Array)
            end
        end

        ## We only write version 1.2 tags
        @data["metadata_version"] = "1.2"

        return @data
        end

        def self.write(filename, data)
        raise "Cannot find file for XMP writing." unless File.file?(filename)
        exiftool_temporary_filename = filename + '_exiftool_tmp'
        exiftool_original_filename = filename + '_original'

        @parameters = ""

        # Elements that need special values when they are blank/nil
        elements = %w(telescope_facility telescope_instrument color_assignment spectral_band spectral_bandpass central_wavelength observation_integration_time observation_start_time)

        # Write special values to elements as needed
        unless data['spectral_band'].blank?
            data['spectral_band'].length.times do |i|
            if elements.map{ |e| data[e][i] rescue [] }.select{ |x| x != "" && x != "undefined" }.empty?
                elements.each do |e|
                data[e][i] = ""
                end
            else
                elements.each do |ele|
                unless data[ele].nil?
                    data[ele][i] = "-" if data[ele][i] == "" || data[ele][i] == "undefined"
                end
                end
            end
            end
        end

        # Write special values to elements as needed
        elements.each do |element|
            unless data[element].blank?
            until data[element].last != "-"
                data[element].pop
            end
            end
        end

        data.each do |field_name, value|
            if ((element = Avm::Element.find(field_name)) && !value.nil? && (value != "undefined"))
            case element.data_type
                when :text
                @parameters += " -xmp-#{element.schema}=\"#{escape_for_exiftool(value)}\""
                when :alternatives
                @parameters += " -xmp-#{element.schema}=\"#{escape_for_exiftool(value)}\""
                when :sequence, :bag
                @parameters += value.collect{|v| " -xmp-#{element.schema}+=\"#{escape_for_exiftool(v)}\""} * ""
                when :iptc_contact
                @parameters += " -xmp-iptcCore:#{element.exif_shorthand}=\"#{escape_for_exiftool(value)}\""
            end
            end
        end

        clear_xmp_from_file(filename)
        stdin, stdout, stderr = Open3.popen3 "#{exiftool} -config #{Avm::PreFlight.avm_exiftool_config} -overwrite_original#{@parameters} #{filename}"
        File.delete exiftool_temporary_filename if File.exists?(exiftool_temporary_filename)
        File.delete exiftool_original_filename if File.exists?(exiftool_original_filename)

        return stdout.readlines.include?("    1 image files updated\n")
        end

    end
end    
