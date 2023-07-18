module Avm
    module Search

        def self.included(klass)
        klass.extend ClassMethods
        end

        #
        # Class Methods
        #
        module ClassMethods
        def search(values, tag_names = nil, options={})
            tup = SmartTuple.new(" AND ")
            tup << ["record_type = ?", options[:record_type]]

            if options[:operand] == :and
            subtup = SmartTuple.new(" AND ")
            else
            subtup = SmartTuple.new(" OR ")
            end

            tag_names = self.general_text_fields if tag_names.nil?

            [tag_names].flatten.each do |tag_name|
            search_terms = self.transmute_fuzzy_values(values)
            search_terms = self.transmute_subject_values(values) if tag_name == "subject"
            subtup << ["tags ->> ? ILIKE ANY (array[?])", tag_name, search_terms]
            end

            tup << subtup
            return self.where(tup.compile)
        end

        def general_text_fields
            ["title", "headline", "description", "object_name", "credit", "telescope_facility", "telescope_instrument", "publisher"]
        end

        def transmute_fuzzy_values(values)
            values = [values].flatten.map{|q| "%#{q}%" }
        end

        def transmute_subject_values(values)
            search_terms = []
            [values].flatten.each do |code|
            code = "*.#{code}".squeeze(".") unless "*ABCD".include?(code[0])
            search_terms << "%#{code}%"
            search_terms << "%#{code.gsub("*","A")}%"
            search_terms << "%#{code.gsub("*","B")}%"
            search_terms << "%#{code.gsub("*","C")}%"
            search_terms << "%#{code.gsub("*","D")}%"
            search_terms << "%#{code.gsub("*","E")}%"
            end
            return search_terms.uniq
        end
        end

        #
        # Instance Methods
        #
        def resource
        self.record_type.constantize.find(self.record_id)
        end
    end
end
    