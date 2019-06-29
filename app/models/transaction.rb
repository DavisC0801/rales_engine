class Transaction < ApplicationRecord
  belongs_to :invoice
  validates_presence_of :credit_card_number, :result
  scope :successful, -> {where(result: "success")}
  default_scope {order(id: :asc)}

  def self.invoice(params)
    joins(:invoice)
    .where(id: params[:id])
    .select("invoices.*")
    .take
  end
end
