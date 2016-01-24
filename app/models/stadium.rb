class Stadium < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :capacity, presence: true, numericality: { only_integer: true }
	validates :address, presence: true
	validates :stockBeers, presence: true, numericality: { only_integer: true }
	validates :priceBeer, presence: true, numericality: { only_integer: true }
	has_many :sales

end
