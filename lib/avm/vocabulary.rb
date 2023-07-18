module Avm
    class Vocabulary

        def self.image_type
        [
            ["Artwork", "Artwork"],
            ["Observation", "Observation"],
            ["Photograph", "Photograph"],
            ["Simulation", "Simulation"],
            ["Planetary", "Planetary"],
            ["Collage", "Collage"],
            ["Chart", "Chart"]
        ]
        end

        def self.image_quality
        [
            ["undefined", ""],
            ["Good", "Good"],
            ["Moderate", "Moderate"],
            ["Poor", "Poor"]
        ]
        end

        def self.metadata_version
        ["1.2", "1.0"]
        end

        def self.coordinate_frame
        [
            ["undefined", ""],
            ["ICRS", "ICRS"],
            ["FK5", "FK5"],
            ["FK4", "FK4"],
            ["ECL", "ECL"],
            ["GAL", "GAL"],
            ["SGAL", "SGAL"]
        ]
        end

        def self.coordinate_system_projection
        [
            ["undefined", ""],
            ["TAN", "TAN"],
            ["SIN", "SIN"],
            ["ARC", "ARC"],
            ["AIT", "AIT"],
            ["CAR", "CAR"]
        ]
        end

        def self.coordinate_data
        [
            ["undefined", ""],
            ["Full", "Full"],
            ["Position", "Position"]
        ]
        end

        def self.color_assignment
        [
            ["undefined", ""],
            ["Purple", "Purple"],
            ["Blue", "Blue"],
            ["Cyan", "Cyan"],
            ["Green", "Green"],
            ["Yellow", "Yellow"],
            ["Orange", "Orange"],
            ["Red", "Red"],
            ["Magenta", "Magenta"],
            ["Grayscale", "Grayscale"],
            ["Pseudocolor", "Pseudocolor"],
            ["Luminosity", "Luminosity"]
        ]
        end

        def self.spectral_band
        [
            ["undefined", ""],
            ["Radio", "Radio"],
            ["Millimeter", "Millimeter"],
            ["Infrared", "Infrared"],
            ["Optical", "Optical"],
            ["Ultraviolet", "Ultraviolet"],
            ["X-ray", "X-ray"],
            ["Gamma-ray", "Gamma-ray"]
        ]
        end
    end
end
