class Item < ApplicationRecord
<<<<<<< HEAD
=======
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
>>>>>>> 4f3a61c9f42fdc9f5e5232bffc5fd1c9dbaf01d9
  default_scope {order(id: :asc)}
end
