class TransactionsRecordsController < ApplicationController
  acceptable_queries = ["id", "invoice_id", "credit_card_number", "result", "created_at", "updated_at"]

  get "/api/v1/transactions/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return TransactionSerializer.new(Transaction.all).to_json
    else
      return TransactionSerializer.new(Transaction.find_all(params)).to_json
    end
  end

  get "/api/v1/transactions/find" do
    if !acceptable_queries.include?(params.keys.first)
      return TransactionSerializer.new(Transaction.all).to_json
    else
      return TransactionSerializer.new(Transaction.find_by("#{params.keys.first} = ?", params.values.first)).to_json
    end
  end

  get "/api/v1/transactions/:id" do
    TransactionSerializer.new(Transaction.find(params[:id])).to_json
  end

  get "/api/v1/transactions" do
    TransactionSerializer.new(Transaction.all).to_json
  end
end
