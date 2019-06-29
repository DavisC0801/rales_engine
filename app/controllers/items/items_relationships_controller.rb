class ItemsRelationshipsController < ApplicationController
  get "/api/v1/items/:id/invoice_items" do
    InvoiceItemSerializer.new(Item.all_invoice_items(params)).to_json
  end

  get "/api/v1/items/:id/merchant" do
    MerchantSerializer.new(Item.merchant(params)).to_json
  end
end
