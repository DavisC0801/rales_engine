class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.revenue(params)
    query = joins(invoices: [:invoice_items, :transactions])
    .where(id: params[:id])
    .merge(Transaction.successful)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price)")
    .group(:id)
    if !params[:date].nil?
      query.where(invoices: {created_at: (params[:date].to_date..params[:date].to_date + 1.day)}).first
    else
      query.first
    end
  end

  def self.favorite_customer(params)
    joins(invoices: [:customer, :transactions])
    .where(id: params[:id])
    .merge(Transaction.successful)
    .select("customers.*, COUNT(transactions.id) AS completed_transactions")
    .group("customers.id")
    .order("completed_transactions DESC")
    .first
  end
end
