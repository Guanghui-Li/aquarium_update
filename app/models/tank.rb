class Tank < ApplicationRecord
    has_many :livestocks, :dependent => :destroy
    
    validates :name, presence: true, uniqueness: true
end
