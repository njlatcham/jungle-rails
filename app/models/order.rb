class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :send_receipt

  def self.find_order_with_details(order_id)
    Order.includes(line_items: [:product]).find(order_id)
  end

  def send_receipt
    UserMailer.send_receipt(self.id).deliver_later
  end
end
