class MerchantsRelationshipsController < ApplicationController
  get "/api/v1/merchants/:id/items" do
    ItemSerializer.new(Merchant.all_items(params)).to_json
  end
  get "/api/v1/merchants/:id/invoices" do
    #returns a collection of invoices associated with that merchant from their known orders
  end
end
