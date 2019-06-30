class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices

  def self.favorite_merchant(params)
    joins(invoices: [:transactions, :merchant])
    .merge(Transaction.successful)
    .where(id: params[:id])
    .select("merchants.*, COUNT(transactions.id)")
    .group("merchants.id")
    .unscope(:order)
    .order("count DESC")
    .take
  end

  def self.all_invoices(params)
    joins(:invoices)
    .where(id: params[:id])
    .select("invoices.*")
  end

  def self.all_transactions(params)
    joins(invoices: :transactions)
    .where(id: params[:id])
    .select("transactions.*")
  end
end
