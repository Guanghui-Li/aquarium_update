class Livestock < ApplicationRecord
    belongs_to :stock_type
    belongs_to :species
    # has_one :color
    # belongs_to :tank
    belongs_to :color
    mount_uploader :image, ImageUploader
    
    validates :stock_type, presence: true
    validates :species, presence: true
    validates :purchase_date, presence: true
    validates :color, presence: true
    validates :tank, presence: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image'
    }
end
