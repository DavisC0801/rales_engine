class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices

  def self.favorite_merchant(params)
    joins(invoices: [:transactions, :merchant])
    .merge(Transaction.successful)
    .where(id: params[:id])
    .select("merchants.*, COUNT(transactions.id)")
    .group("merchants.id")
    .order("count DESC")
    .first
  end

  def self.find_invoices(params)
    joins(:invoices)
    .where(id: params[:id])
    .select("invoices.*")
  end

  def self.find_transactions(params)
    joins(invoices: :transactions)
    .where(id: params[:id])
    .select("merchants.*, COUNT(transactions.id)")
    .group("merchants.id")
  end
end
