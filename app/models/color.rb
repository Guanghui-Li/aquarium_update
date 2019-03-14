class Color < ApplicationRecord
    has_many :livestocks
    
    validates :name, presence: true
end
