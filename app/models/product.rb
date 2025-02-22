class Product < ApplicationRecord

    before_destroy :ensure_not_product_item
    
    has_many :product_items
    
    validates :title, :description, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    
    has_attached_file :image, styles: { medium: "300*300>", thumb: "100*100>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    def ensure_not_product_item
        if product_items.empty?
            return true
        else
            errors.add(:base, 'You have Product Items')
            return false
        end
    end
end
