class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  validates_presence_of :name

  def self.revenue(params)
    query = joins(invoices: [:invoice_items, :transactions])
    .where(id: params[:id])
    .merge(Transaction.successful)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price)")
    .unscope(:order)
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
    .unscope(:order)
    .order("completed_transactions DESC")
    .first
  end

  def self.customers_with_pending_invoices(params)
    find_by_sql("SELECT DISTINCT customers.* FROM merchants INNER JOIN invoices ON
      invoices.merchant_id = merchants.id INNER JOIN customers ON
      customers.id = invoices.customer_id LEFT OUTER JOIN transactions ON
      transactions.invoice_id = invoices.id WHERE merchants.id = #{params[:id]}
      AND invoices.id IN (SELECT invoices.id FROM invoices
      LEFT OUTER JOIN transactions ON transactions.invoice_id = invoices.id
      WHERE (transactions.result = 'failed' OR transactions.result is NULL)
      EXCEPT (SELECT invoices.id FROM invoices INNER JOIN transactions
      ON transactions.invoice_id = invoices.id WHERE transactions.result = 'success'))")
  end

  def self.most_revenue(params)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price)")
    .group(:id)
    .unscope(:order)
    .order("sum DESC")
    .limit(params[:quantity])
  end

  def self.most_items(params)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .select("merchants.*, SUM(invoice_items.quantity)")
    .group(:id)
    .unscope(:order)
    .order("sum DESC")
    .limit(params[:quantity])
  end

  def self.most_revenue(params)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price)")
    .group(:id)
    .unscope(:order)
    .order("sum DESC")
    .limit(params[:quantity])
  end

  def self.total_revenue(params)
    revenue = self.joins(invoices: [:invoice_items, :transactions])
    .select("SUM(invoice_items.quantity * invoice_items.unit_price)")
    .where(invoices: {created_at: (params[:date].to_date..params[:date].to_date + 1.day)})
    .merge(Transaction.successful)
    .unscope(:order)
    .take
  end

  def self.all_items(params)
    joins(:items)
    .where(id: params[:id])
    .select("items.*")
  end

  def self.all_invoices(params)
    joins(:invoices)
    .where(id: params[:id])
    .select("invoices.*")
  end
end
