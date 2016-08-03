class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :img, presence: true
  validates :price, presence: true, :numericality => {:greater_than => 0}
  validates :description, presence: true
  validates :retired, :inclusion => { in: [true, false] }

  def quantity(order_id)
    find_order_items(order_id).quantity
  end

  def sub_total(order_id)
    find_order_items(order_id).sub_total
  end

  def find_order_items(order_id)
    self.order_items.find_by(order_id: order_id)
  end
end
