class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :stadium
      t.string :information
      t.integer :n_beers
      t.integer :price
      t.integer :type_transaction, default: 0
      t.timestamps null: false
    end
  end
end
