class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  default_scope {order(id: :asc)}

  def self.all_invoice_items(params)
    joins(:invoice_items)
    .where(id: params[:id])
    .select("invoice_items.*")
  end

  def self.merchant(params)
    joins(:merchant)
    .where(id: params[:id])
    .select("merchants.*")
    .take
  end

  def self.most_revenue(params)
    joins(invoices: [:transactions, :invoice_items])
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price)")
    .merge(Transaction.successful)
    .group(:id)
    .unscope(:order)
    .order("sum DESC")
    .limit(params[:quantity])
  end

  def self.most_items(params)
    joins(invoices: :transactions)
    .select("items.*, SUM(invoice_items.quantity)")
    .merge(Transaction.successful)
    .group(:id)
    .unscope(:order)
    .order("sum DESC")
    .limit(params[:quantity])
  end

  def self.best_day(params)
    joins(invoices: :transactions)
    .merge(Transaction.successful)
    .select("invoices.created_at AS best_day, SUM(invoice_items.quantity)")
    .where(id: params[:id])
    .group("invoices.created_at")
    .unscope(:order)
    .order("sum DESC, invoices.created_at DESC")
    .take
  end
end
