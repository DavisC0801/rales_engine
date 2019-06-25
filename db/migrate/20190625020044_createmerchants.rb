class Createmerchants < ActiveRecord::Migration[5.2]
  def up
    create_table :merchants do |t|
      t.string :name
      t.timestamps
    end
  end
end
