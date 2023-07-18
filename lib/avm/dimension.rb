
module Avm
    class Dimension < OpenStruct

        def self.all
        [
            # {:name => 'tiniest',  :bounding_box => 32,    :upsample => true,  :format => 'jpg'},
            # {:name => 'tinier',   :bounding_box => 64,    :upsample => true,  :format => 'jpg'},
            # {:name => 'tiny',     :bounding_box => 75,    :upsample => true,  :format => 'jpg'},
            # {:name => 'smallest', :bounding_box => 100,   :upsample => true,  :format => 'jpg'},
            # {:name => 'smaller',  :bounding_box => 128,   :upsample => true,  :format => 'jpg'},
            {:name => 'small',    :bounding_box => 240,   :upsample => true,  :format => 'jpg'},
            {:name => 'medium',   :bounding_box => 320,   :upsample => true,  :format => 'jpg', :xmp => true},
            {:name => 'large',    :bounding_box => 500,   :upsample => true,  :format => 'jpg', :xmp => true},
            # {:name => 'larger',   :bounding_box => 1024,  :upsample => true,  :format => 'jpg', :xmp => true},
            # {:name => 'largest',  :bounding_box => 1280,  :upsample => true,  :format => 'jpg', :xmp => true},
            # {:name => 'huge',     :bounding_box => 1600,  :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'huger',    :bounding_box => 3000,  :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'hugest',   :bounding_box => 6000,  :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'gigantic', :bounding_box => 12000, :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'titanic',  :bounding_box => 24000, :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'colossal', :bounding_box => 48000, :upsample => false, :format => 'jpg', :xmp => true},
            # {:name => 'maximum',  :bounding_box => 64000, :upsample => false, :format => 'jpg', :xmp => true}
        ].map{|d| self.new(d)}
        end
    end
end

