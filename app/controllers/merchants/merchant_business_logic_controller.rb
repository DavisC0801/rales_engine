class MerchantsBusinessLogicController < ApplicationController
  get "/api/v1/merchants/:id/revenue" do
    RevenueSerializer.new(Merchant.revenue(params)).to_json
  end

  get "/api/v1/merchants/:id/favorite_customer" do
    CustomerSerializer.new(Merchant.favorite_customer(params)).to_json
  end
  
  get "/api/v1/merchants/:id/customers_with_pending_invoices" do
    CustomerSerializer.new(Merchant.customers_with_pending_invoices(params)).to_json
  end

  get "/api/v1/merchants/most_revenue" do
    MerchantSerializer.new(Merchant.most_revenue(params)).to_json
  end

  get "/api/v1/merchants/most_items" do
    MerchantSerializer.new(Merchant.most_items(params)).to_json
  end

  get "/api/v1/merchants/revenue" do
    TotalRevenueSerializer.new(Merchant.total_revenue(params)).to_json
  end
end
