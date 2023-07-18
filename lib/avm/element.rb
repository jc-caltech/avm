module Avm
    class Element < OpenStruct
        def self.find(field_name)
        self.all.select{|e| e.field_name == field_name}.first
        end

        def self.find_by_field_type(*field_types)
        self.all.select{|e| field_types.include?(e.field_type)}
        end

        def self.find_by_tag_name(tag_name)
        self.all.select{|e| e.tag_name == tag_name}.first
        end

        def self.all
        [
            {name:'Creator',                      tag_name:'Creator',                       schema:'photoshop:Source',                   data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Contact Name',                 tag_name:'Contact.Name',                  schema:'dc:creator',                         data_type: :sequence,      condition: :string,      min_length: 1, field_type: :string},
            {name:'Creator URL',                  tag_name:'CreatorURL',                    schema:'Iptc4xmpCore:CiUrlWork',             data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :url,     exif_shorthand:'CreatorWorkURL'},
            {name:'Contact Email',                tag_name:'Contact.Email',                 schema:'Iptc4xmpCore:CiEmailWork',           data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorWorkEmail'},
            {name:'Contact Telephone',            tag_name:'Contact.Telephone',             schema:'Iptc4xmpCore:CiTelWork',             data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorWorkTelephone'},
            {name:'Contact Address',              tag_name:'Contact.Address',               schema:'Iptc4xmpCore:CiAdrExtadr',           data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorAddress'},
            {name:'Contact City',                 tag_name:'Contact.City',                  schema:'Iptc4xmpCore:CiAdrCity',             data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorCity'},
            {name:'Contact State/Province',       tag_name:'Contact.StateProvince',         schema:'Iptc4xmpCore:CiAdrRegion',           data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorRegion'},
            {name:'Contact Postal Code',          tag_name:'Contact.PostalCode',            schema:'Iptc4xmpCore:CiAdrPcode',            data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorPostalCode'},
            {name:'Contact Country',              tag_name:'Contact.Country',               schema:'Iptc4xmpCore:CiAdrCtry',             data_type: :iptc_contact,  condition: :string,      min_length: 0, field_type: :string,  exif_shorthand:'CreatorCountry'},
            {name:'Rights',                       tag_name:'Rights',                        schema:'xapRights:UsageTerms',               data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Title',                        tag_name:'Title',                         schema:'dc:title',                           data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Headline',                     tag_name:'Headline',                      schema:'photoshop:Headline',                 data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Description',                  tag_name:'Description',                   schema:'dc:description',                     data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Alt Text',                     tag_name:'Alt.Text',                      schema:'iptcCore:AltTextAccessibility',  data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Extended Description',         tag_name:'Extended.Description',          schema:'iptcCore:ExtDescrAccessibility', data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Subject',                      tag_name:'Subject.Category',              schema:'avm:Subject.Category',               data_type: :bag,           condition: :subject,     min_length: 1, field_type: :string},
            {name:'Object Name',                  tag_name:'Subject.Name',                  schema:'dc:subject',                         data_type: :bag,           condition: :string,      min_length: 1, field_type: :string},
            {name:'Distance',                     tag_name:'Distance',                      schema:'avm:Distance',                       data_type: :sequence,      condition: :number,      min_length: 2, field_type: :string},
            {name:'Distance Notes',               tag_name:'Distance.Notes',                schema:'avm:Distance.Notes',                 data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Reference URL',                tag_name:'ReferenceURL',                  schema:'avm:ReferenceURL',                   data_type: :text,          condition: :string,      min_length: 0, field_type: :url},
            {name:'Credit',                       tag_name:'Credit',                        schema:'photoshop:Credit',                   data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Release Date',                 tag_name:'Date',                          schema:'photoshop:DateCreated',              data_type: :text,          condition: :datetime,    min_length: 0, field_type: :datetime},
            {name:'Image ID',                     tag_name:'ID',                            schema:'avm:ID',                             data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Image Type',                   tag_name:'Type',                          schema:'avm:Type',                           data_type: :text,          condition: :controlled,  min_length: 0, field_type: :string},
            {name:'Image Quality',                tag_name:'Image.ProductQuality',          schema:'avm:Image.ProductQuality',           data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Proposal ID',                  tag_name:'ProposalID',                    schema:'avm:ProposalID',                     data_type: :bag,           condition: :string,      min_length: 1, field_type: :string},
            {name:'Publication ID',               tag_name:'PublicationID',                 schema:'avm:PublicationID',                  data_type: :bag,           condition: :string,      min_length: 1, field_type: :string},
            {name:'Telescope Facility',           tag_name:'Facility',                      schema:'avm:Facility',                       data_type: :sequence,      condition: :string,      min_length: 1, field_type: :string},
            {name:'Telescope Instrument',         tag_name:'Instrument',                    schema:'avm:Instrument',                     data_type: :sequence,      condition: :string,      min_length: 1, field_type: :string},
            {name:'Color Assignment',             tag_name:'Spectral.ColorAssignment',      schema:'avm:Spectral.ColorAssignment',       data_type: :sequence,      condition: :controlled,  min_length: 1, field_type: :string},
            {name:'Spectral Band',                tag_name:'Spectral.Band',                 schema:'avm:Spectral.Band',                  data_type: :sequence,      condition: :controlled,  min_length: 1, field_type: :string},
            {name:'Spectral Bandpass',            tag_name:'Spectral.Bandpass',             schema:'avm:Spectral.Bandpass',              data_type: :sequence,      condition: :string,      min_length: 1, field_type: :string},
            {name:'Central Wavelength',           tag_name:'Spectral.CentralWavelength',    schema:'avm:Spectral.CentralWavelength',     data_type: :sequence,      condition: :number,      min_length: 1, field_type: :float},
            {name:'Spectral Notes',               tag_name:'Spectral.Notes',                schema:'avm:Spectral.Notes',                 data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'Observation Start Time',       tag_name:'Temporal.StartTime',            schema:'avm:Temporal.StartTime',             data_type: :sequence,      condition: :datetime,    min_length: 1, field_type: :datetime},
            {name:'Observation Integration Time', tag_name:'Temporal.IntegrationTime',      schema:'avm:Temporal.IntegrationTime',       data_type: :sequence,      condition: :number,      min_length: 1, field_type: :float},
            {name:'Dataset ID',                   tag_name:'DatasetID',                     schema:'avm:DatasetID',                      data_type: :sequence,      condition: :string,      min_length: 1, field_type: :string},
            {name:'Coordinate Frame',             tag_name:'Spatial.CoordinateFrame',       schema:'avm:Spatial.CoordinateFrame',        data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Equinox',                      tag_name:'Spatial.Equinox',               schema:'avm:Spatial.Equinox',                data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Reference Value',              tag_name:'Spatial.ReferenceValue',        schema:'avm:Spatial.ReferenceValue',         data_type: :sequence,      condition: :number,      min_length: 2, field_type: :float},
            {name:'Reference Dimension',          tag_name:'Spatial.ReferenceDimension',    schema:'avm:Spatial.ReferenceDimension',     data_type: :sequence,      condition: :number,      min_length: 2, field_type: :float},
            {name:'Reference Pixel',              tag_name:'Spatial.ReferencePixel',        schema:'avm:Spatial.ReferencePixel',         data_type: :sequence,      condition: :number,      min_length: 2, field_type: :float},
            {name:'Scale',                        tag_name:'Spatial.Scale',                 schema:'avm:Spatial.Scale',                  data_type: :sequence,      condition: :number,      min_length: 2, field_type: :float},
            {name:'Rotation',                     tag_name:'Spatial.Rotation',              schema:'avm:Spatial.Rotation',               data_type: :text,          condition: :number,      min_length: 0, field_type: :float},
            {name:'Coordinate System Projection', tag_name:'Spatial.CoordsystemProjection', schema:'avm:Spatial.CoordsystemProjection',  data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Coordinate Data',              tag_name:'Spatial.Quality',               schema:'avm:Spatial.Quality',                data_type: :text,          condition: :controlled,  min_length: 0, field_type: :string},
            {name:'Spatial Notes',                tag_name:'Spatial.Notes',                 schema:'avm:Spatial.Notes',                  data_type: :alternatives,  condition: :string,      min_length: 0, field_type: :string},
            {name:'FITS Header',                  tag_name:'Spatial.FITSheader',            schema:'avm:Spatial.FITSheader',             data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Publisher',                    tag_name:'Publisher',                     schema:'avm:Publisher',                      data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Publisher ID',                 tag_name:'PublisherID',                   schema:'avm:PublisherID',                    data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Resource ID',                  tag_name:'ResourceID',                    schema:'avm:ResourceID',                     data_type: :text,          condition: :string,      min_length: 0, field_type: :string},
            {name:'Resource URL',                 tag_name:'ResourceURL',                   schema:'avm:ResourceURL',                    data_type: :text,          condition: :string,      min_length: 0, field_type: :url},
            {name:'Related Resources',            tag_name:'RelatedResources',              schema:'avm:RelatedResources',               data_type: :bag,           condition: :string,      min_length: 1, field_type: :string},
            {name:'Metadata Date',                tag_name:'MetadataDate',                  schema:'avm:MetadataDate',                   data_type: :text,          condition: :datetime,    min_length: 0, field_type: :datetime},
            {name:'Metadata Version',             tag_name:'MetadataVersion',               schema:'avm:MetadataVersion',                data_type: :text,          condition: :string,      min_length: 0, field_type: :string}
        ].map{|h| self.new(h.merge({field_name: h[:name].downcase.gsub(" ", "_").gsub("/", "_")}))}
        end

        def self.empty
        avm_data = {}
        self.all.each do |element|
            case element.data_type
            when :text, :alternatives, :iptc_contact
                avm_data[element.field_name] = ""
            when :bag, :sequence
                avm_data[element.field_name] = []
                element.min_length.times do
                avm_data[element.field_name] << ""
                end
            end
        end

        return avm_data
        end

        def self.default_values
        avm_default_data = YAML::load_file(Avm::PreFlight.avm_default_data_yaml)
        return avm_default_data
        end
    end
end

