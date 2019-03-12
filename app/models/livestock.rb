class Livestock < ApplicationRecord
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
