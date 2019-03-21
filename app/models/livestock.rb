class Livestock < ApplicationRecord
    belongs_to :stock_type
    belongs_to :species
    belongs_to :status
    belongs_to :tank
    belongs_to :color
    belongs_to :user
    has_many :histories, :dependent => :destroy
    mount_uploader :image, ImageUploader
    
    
    attr_accessor :quantity
     
    validates :stock_type, presence: true
    validates :species, presence: true
    validates :purchase_date, presence: true
    validates :color, presence: true
    validates :tank, presence: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,
        message: 'must be a URL for GIF, JPG, jpeg or PNG image'
    }
end
