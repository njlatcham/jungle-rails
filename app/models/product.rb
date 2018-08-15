class Product < ActiveRecord::Base

    monetize :price_cents, numericality: true
    mount_uploader :image, ProductImageUploader

    belongs_to :category

    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
    validates :category, presence: true

    # Waiting for Dave to show me how to do this
    # def sold_out?
    #     if quantity <= 0
    #         puts "SOLD OUT"
    #     end
    # end
end


