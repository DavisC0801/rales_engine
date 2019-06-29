class InvoicesRecordsController < ApplicationController
  acceptable_queries = ["id", "customer_id", "merchant_id", "status", "created_at", "updated_at"]

  get "/api/v1/invoices/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return InvoiceSerializer.new(Invoice.all).to_json
    else
      return InvoiceSerializer.new(Invoice.find_all(params)).to_json
    end
  end

  get "/api/v1/invoices/find" do
    if !acceptable_queries.include?(params.keys.first)
      return InvoiceSerializer.new(Invoice.all).to_json
    else
      return InvoiceSerializer.new(Invoice.find_by("#{params.keys.first} = ?", params.values.first)).to_json
    end
  end

  get "/api/v1/invoices/:id" do
    InvoiceSerializer.new(Invoice.find(params[:id])).to_json
  end

  get "/api/v1/invoices" do
    InvoiceSerializer.new(Invoice.all).to_json
  end
end
