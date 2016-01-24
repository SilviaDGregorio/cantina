class Sale < ActiveRecord::Base

	belongs_to :stadiums

	enum type_transaction: { sale: 0, add_stock: 1 }

	validates :n_beers, presence: true
	validates :type_transaction, presence: true
	validates :price, presence: true


end
