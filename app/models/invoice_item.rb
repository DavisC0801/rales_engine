class InvoiceItem < ApplicationRecord
  validates_presence_of :quantity, :unit_price
  belongs_to :invoice
  belongs_to :item
  default_scope {order(id: :asc)}

  def self.invoice(params)
    joins(:invoice)
    .where(id: params[:id])
    .select("invoices.*")
    .take
  end

  def self.item(params)
    joins(:item)
    .where(id: params[:id])
    .select("items.*")
    .take
  end
end
