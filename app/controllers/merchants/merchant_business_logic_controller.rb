class MerchantsBusinessLogicController < ApplicationController
  # Single Merchant
  get "/api/v1/merchants/:id/revenue" do
    RevenueSerializer.new(Merchant.revenue(params)).to_json
  end
  get "/api/v1/merchants/:id/favorite_customer" do
    CustomerSerializer.new(Merchant.favorite_customer(params)).to_json
  end
  get "/api/v1/merchants/:id/customers_with_pending_invoices" do
    # returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
  end

  # All Merchants
  get "/api/v1/merchants/most_revenue" do
    # returns the top x merchants ranked by total revenue
  end

  get "/api/v1/merchants/most_items" do
    #returns the top x merchants ranked by total number of items sold
  end

  get "/api/v1/merchants/revenue" do
    #returns the total revenue for date x across all merchants
  end
  # Assume the dates provided match the format of a standard ActiveRecord timestamp.
end
