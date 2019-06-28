class MerchantsRelationshipsController < ApplicationController
  get "/api/v1/merchants/:id/items" do
    ItemSerializer.new(Merchant.all_items(params)).to_json
  end
  
  get "/api/v1/merchants/:id/invoices" do
    InvoiceSerializer.new(Merchant.all_invoices(params)).to_json
  end
end
