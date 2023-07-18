module Avm
    module PreFlight

        require 'open3'

        def self.run
        require_exiftool
        require_avm_default_data_yaml
        end

        def self.avm_exiftool_config
        avm_exiftool_config = File.expand_path("config/avm_exiftool.config", __dir__)
        end

        def self.avm_default_data_yaml
        avm_default_data_yaml = File.expand_path("config/avm_default_data.yml", __dir__)
        end

        def self.require_exiftool
            unless File.exist?(avm_exiftool_config)
                raise "Exiftool config file for AVM data must exist at: #{avm_exiftool_config}"
            end

        return true
        end

        def self.require_avm_default_data_yaml
            unless File.exist?(avm_default_data_yaml)
                File.open((avm_default_data_yaml), 'w') { |file| file.write(Avm::Element.empty.to_yaml) }
            end
            return true
        end

    end
end

    
