class Color < ApplicationRecord
    before_destroy :ensure_not_referenced_by_any_livestock
    has_many :livestocks
    
    validates :name, presence: true
    
    private
    #ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_livestock
        unless livestocks.empty?
            errors.add(:base, 'Livestocks present')
            throw :abort
        end
    end
end
