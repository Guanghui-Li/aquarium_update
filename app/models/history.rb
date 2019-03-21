class History < ApplicationRecord
    belongs_to :livestock
    belongs_to :user
    mount_uploader :image, ImageUploader
    validates :event, presence: true
    validates :event_date, presence: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image'
    }
end
