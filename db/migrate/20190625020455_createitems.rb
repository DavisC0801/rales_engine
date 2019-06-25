class Createitems < ActiveRecord::Migration[5.2]
  def up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :unit_price
      t.references :merchant, foreign_key: true
      t.timestamps
    end
  end
end
