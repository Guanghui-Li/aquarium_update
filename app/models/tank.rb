class Tank < ApplicationRecord
    has_many :livestocks, :dependent => :destroy
    belongs_to :user
    
    validates_uniqueness_of :name, :scope => :user_id
    validates :name, presence: true
end
