class Species < ApplicationRecord
    has_many :livestocks
    
    validates :name, presence: true
end
