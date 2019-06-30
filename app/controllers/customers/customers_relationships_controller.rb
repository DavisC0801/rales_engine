class CustomersRelationshipsController < ApplicationController
    get "/api/v1/customers/:id/invoices" do
      InvoiceSerializer.new(Customer.all_invoices(params)).to_json
    end

    get "/api/v1/customers/:id/transactions" do
      TransactionSerializer.new(Customer.all_transactions(params)).to_json
    end
end
