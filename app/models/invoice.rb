class Invoice < ApplicationRecord
  validates_presence_of :status
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  default_scope {order(id: :asc)}

  def self.all_transactions(params)
    joins(:transactions)
    .where(id: params[:id])
    .select("transactions.*")
  end

  def self.all_items(params)
    joins(:items)
    .where(id: params[:id])
    .select("items.*")
  end

  def self.all_invoice_items(params)
    joins(:invoice_items)
    .where(id: params[:id])
    .select("invoice_items.*")
  end

  def self.customer(params)
    joins(:customer)
    .where(id: params[:id])
    .select("customers.*")
    .take
  end

  def self.merchant(params)
    joins(:merchant)
    .where(id: params[:id])
    .select("merchants.*")
    .take
  end
end
