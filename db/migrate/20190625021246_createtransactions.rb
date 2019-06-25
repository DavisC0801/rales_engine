class Createtransactions < ActiveRecord::Migration[5.2]
  def up
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.integer :credit_card_number
      t.integer :credit_card_experation_date
      t.integer :quantity
      t.string :result
      t.timestamps
    end
  end
end
