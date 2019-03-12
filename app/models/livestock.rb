class Livestock < ApplicationRecord
    has_one :type
    has_one :species
    has_one :color
end
