class CreateStadiums < ActiveRecord::Migration
  def change
    create_table :stadiums do |t|
      t.string :name
      t.integer :capacity
      t.string :address
      t.integer :stockBeers
      t.integer :priceBeer
      t.timestamps null: false
    end
  end
end
