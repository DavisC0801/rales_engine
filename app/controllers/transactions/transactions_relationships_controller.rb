class TransactionsRelationshipsController < ApplicationController
  get "/api/v1/transactions/:id/invoice" do
    InvoiceSerializer.new(Transaction.invoice(params)).to_json
  end
end
