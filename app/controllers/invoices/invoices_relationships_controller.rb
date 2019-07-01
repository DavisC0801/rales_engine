class InvoicesRelationshipsController < ApplicationController
    get "/api/v1/invoices/:id/transactions" do
      TransactionSerializer.new(Invoice.all_transactions(params)).to_json
    end

    get "/api/v1/invoices/:id/invoice_items" do
      InvoiceItemSerializer.new(Invoice.all_invoice_items(params)).to_json
    end

    get "/api/v1/invoices/:id/items" do
      ItemSerializer.new(Invoice.all_items(params)).to_json
    end

    get "/api/v1/invoices/:id/customer" do
      CustomerSerializer.new(Invoice.customer(params)).to_json
    end

    get "/api/v1/invoices/:id/merchant" do
      MerchantSerializer.new(Invoice.merchant(params)).to_json
    end
end
