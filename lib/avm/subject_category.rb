module Avm
    class SubjectCategory
        def self.all
        [
            'Planet', [
            'Type', [
                'Terrestrial', [],
                'Gas Giant', []
            ],
            'Feature', [
                'Surface', [
                'Mountain', [],
                'Canyon', [],
                'Volcanic', [],
                'Impact', [],
                'Erosion', [],
                'Liquid', [],
                'Ice', []
                ],
                'Atmosphere', [
                'Cloud', [],
                'Storm', [],
                'Belt', [],
                'Aurora', []
                ]
            ],
            'Special Cases', [
                'Transiting', [],
                'Hot Jupiter', [],
                'Pulsar planet', []
            ],
            'Satellite', [
                'Feature', [
                'Surface', [
                    'Mountain', [],
                    'Canyon', [],
                    'Volcanic', [],
                    'Impact', [],
                    'Erosion', [],
                    'Liquid', [],
                    'Ice', []
                ],
                'Atmosphere', []
                ]
            ],
            'Ring', []
            ],
            'Interplanetary Body', [
            'Dwarf planet', [],
            'Comet', [
                'Nucleus', [],
                'Coma', [],
                'Tail', [
                'Dust', [],
                'Gas', []
                ]
            ],
            'Asteroid', [],
            'Meteoroid', []
            ],
            'Star', [
            'Evolutionary Stage', [
                'Protostar', [],
                'Young Stellar Object', [],
                'Main Sequence', [],
                'Red Giant', [],
                'Red Supergiant', [],
                'Blue Supergiant', [],
                'White Dwarf', [],
                'Supernova', [],
                'Neutron Star', [
                'Pulsar', [],
                'Magnetar', []
                ],
                'Black Hole', []
            ],
            'Type', [
                'Variable', [
                'Pulsating', [],
                'Irregular', [],
                'Eclipsing', [],
                'Flare Star', [],
                'Nova', []
                ],
                'Carbon', [],
                'Brown Dwarf', [],
                'Wolf-Rayet', [],
                'Blue Straggler', [],
                'Exotic', []
            ],
            'Spectral Type', [
                'O', [],
                'B', [],
                'A', [],
                'F', [],
                'G', [],
                'K', [],
                'M', [],
                'L', [],
                'T', []
            ],
            'Population', [
                'I', [],
                'II', [],
                'III', []
            ],
            'Feature', [
                'Photosphere', [
                'Granulation', [],
                'Sunspot', []
                ],
                'Chromosphere', [
                'Flare', [],
                'Facula', []
                ],
                'Corona', [
                'Prominence', []
                ]
            ],
            'Grouping', [
                'Binary', [],
                'Triple', [],
                'Multiple', [],
                'Cluster', [
                'Open', [],
                'Globular', []
                ]
            ],
            'Circumstellar Material', [
                'Planetary System', [],
                'Disk', [
                'Protoplanetary', [],
                'Accretion', [],
                'Debris', []
                ],
                'Outflow', [
                'Solar Wind', [],
                'Coronal Mass Ejection', []
                ]
            ]
            ],
            'Nebula', [
            'Type', [
                'Interstellar Medium', [],
                'Star Formation', [],
                'Planetary', [],
                'Supernova Remnant', [],
                'Jet', []
            ],
            'Appearance', [
                'Emission', [
                'H II Region', []
                ],
                'Reflection', [
                'Light Echo', []
                ],
                'Dark', [
                'Molecular Cloud', [],
                'Bok Globule', [],
                'Proplyd' , []
                ]
            ]
            ],
            'Galaxy', [
            'Type', [
                'Spiral', [],
                'Barred', [],
                'Lenticular', [],
                'Elliptical', [],
                'Ring', [],
                'Irregular', [],
                'Interacting', [],
                'Gravitationally Lensed', []
            ],
            'Size', [
                'Giant', [],
                'Dwarf', []
            ],
            'Activity', [
                'Normal', [],
                'AGN', [
                'Quasar', [],
                'Seyfert', [],
                'Blazar', [],
                'Liner', []
                ],
                'Starburst', [],
                'Ultraluminous', []
            ],
            'Component', [
                'Bulge', [],
                'Bar', [],
                'Disk', [],
                'Halo', [],
                'Ring', [],
                'Central Black Hole', [],
                'Spiral Arm', [],
                'Dust Lane', [],
                'Center/Core', []
            ],
            'Grouping', [
                'Pair', [],
                'Multiple', [],
                'Cluster', [],
                'Supercluster', []
            ]
            ],
            'Cosmology', [
            'Morphology', [
                'Deep Field', [],
                'Large-Scale Structure', [],
                'Cosmic Background', []
            ],
            'Phenomenon', [
                'Lensing', [],
                'Gamma Ray Burst', [],
                'Dark Matter', []
            ]
            ],
            'Sky Phenomenon', [
            'Night Sky', [
                'Constellation', [],
                'Asterism', [],
                'Milky Way', [],
                'Trail', [
                'Meteor', [],
                'Star', [],
                'Satellite', []
                ],
                'Zodiacal Light', [
                'Gegenschein', []
                ],
                'Night glow', []
            ],
            'Eclipse', [
                'Solar', [
                'Total', [],
                'Partial', [],
                'Annular', []
                ],
                'Lunar', [
                'Total', [],
                'Partial', [],
                'Penumbral', []
                ],
                'Occultation', [],
                'Transit', []
            ],
            'Light Phenomenon', [
                'Sunrise-Sunset', [
                'Green flash', [],
                'Refractive Distortion', [],
                'Sun Pillar', []
                ],
                'Cloud', [
                'Iridescent', [],
                'Noctilucent', [],
                'Nacreous', [],
                'Corona', [],
                'Glory', []
                ],
                'Rainbow', [
                'Moonbow', [],
                'Fogbow', []
                ],
                'Halo', [
                'Circle', [],
                'Parhelia', [],
                'Arc', []
                ],
                'Ray-Shadow', [
                'Crepuscular ray', [],
                'Anti-crepuscular ray', [],
                'Earth shadow', []
                ],
                'Lightning', [],
                'Aurora', []
            ]
            ],
            'Technology', [
            'Observatory', [
                'Facility', [],
                'Telescope', [],
                'Instrument', [],
                'Detector', []
            ],
            'Spacecraft', [
                'Orbiter', [],
                'Probe', [],
                'Lander', [],
                'Manned', []
            ],
            'Launch Vehicle', []
            ],
            'People', [
            'Scientist', [],
            'Astronaut', [],
            'Other/General', []
            ],
            'Mission Graphics', [
            'Logos', [],
            'Diagrams', [],
            'People', [],
            'Infrared Imagery', []
            ]
        ]
        end

        def self.prefixes
        [
            ['*', 'All'],
            ['A', 'Solar System'],
            ['B', 'Milky Way'],
            ['C', 'Local Universe'],
            ['D', 'Early Universe'],
            ['E', 'Unspecified']
        ]
        end

        def self.code_to_string( code )
        string = ""
        parts = code.split( '.' )
        string << self.all[ ( parts[1].to_i - 1 ) * 2 ] if ( self.all[ ( parts[1].to_i - 1 ) * 2 ] && parts[1] && ( parts[1].to_i >= 0 ) )

        if ( self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i - 1 ) * 2 ] && ( parts[1] && ( parts[1].to_i >= 0 ) ) && ( parts[2] && ( parts[2].to_i >= 0 ) ) )
            string << " > " + self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i - 1 ) * 2 ]

            if ( self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i * 2 ) - 1 ][ ( parts[3].to_i - 1 ) * 2 ] && ( parts[1] && ( parts[1].to_i >= 0 ) ) && ( parts[2] && ( parts[2].to_i >= 0 ) ) && ( parts[3] && ( parts[3].to_i >= 0 ) ) )
            string << " > " + self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i * 2 ) - 1 ][ ( parts[3].to_i - 1 ) * 2 ]

            if ( self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i * 2 ) - 1 ][ ( parts[3].to_i * 2 ) - 1 ][ ( parts[4].to_i - 1 ) * 2 ] && ( parts[1] && ( parts[1].to_i >= 0 ) ) && ( parts[2] && ( parts[2].to_i >= 0 ) ) && ( parts[3] && ( parts[3].to_i >= 0 ) ) && ( parts[4] && ( parts[4].to_i >= 0 ) ) )
                string << " > " + self.all[ ( parts[1].to_i * 2 ) -1 ][ ( parts[2].to_i * 2 ) - 1 ][ ( parts[3].to_i * 2 ) - 1 ][ ( parts[4].to_i - 1 ) * 2 ]
            end
            end
        end

        return string
        end

    end
end
