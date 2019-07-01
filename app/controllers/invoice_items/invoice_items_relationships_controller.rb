class InvoiceItemsRelationshipsController < ApplicationController
  get "/api/v1/invoice_items/:id/invoice" do
    InvoiceSerializer.new(InvoiceItem.invoice(params)).to_json
  end

  get "/api/v1/invoice_items/:id/item" do
    ItemSerializer.new(InvoiceItem.item(params)).to_json
  end
end
