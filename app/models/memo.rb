class Memo < ApplicationRecord
    validates :memo_date, presence: true
    validates :description, presence: true
    
    belongs_to :user
end
