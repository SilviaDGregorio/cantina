class AddBeersSoldToStadiums < ActiveRecord::Migration
  def change
    add_column :stadiums, :beersSold, :integer
  end
end
