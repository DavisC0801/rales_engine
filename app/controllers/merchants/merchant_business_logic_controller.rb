class MerchantsBusinessLogicController < ApplicationController
  # Single Merchant
  get "/api/v1/merchants/:id/revenue" do
    RevenueSerializer.new(Merchant.revenue(params)).to_json
  end
  get "/api/v1/merchants/:id/favorite_customer" do
    CustomerSerializer.new(Merchant.favorite_customer(params)).to_json
  end
  get "/api/v1/merchants/:id/customers_with_pending_invoices" do
    CustomerSerializer.new(Merchant.customers_with_pending_invoices(params)).to_json
  end

  # All Merchants
  get "/api/v1/merchants/most_revenue" do
    MerchantSerializer.new(Merchant.most_revenue(params)).to_json
  end

  get "/api/v1/merchants/most_items" do
    #returns the top x merchants ranked by total number of items sold
  end

  get "/api/v1/merchants/revenue" do
    #returns the total revenue for date x across all merchants
  end
  # Assume the dates provided match the format of a standard ActiveRecord timestamp.
end
