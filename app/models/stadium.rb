class Stadium < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :capacity, presence: true
	validates :address, presence: true
	validates :stockBeers, presence: true
	validates :priceBeer, presence: true

end
