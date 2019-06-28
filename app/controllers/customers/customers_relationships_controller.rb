class CustomersRelationshipsController < ApplicationController
    get "/api/v1/customers/:id/invoices" do
      InvoiceSerializer.new(Customer.find_invoices(params)).to_json
    end
    
    get "/api/v1/customers/:id/transactions" do
      TransactionSerializer.new(Customer.find_transactions(params)).to_json
    end
end
