class Sale < ActiveRecord::Base

	belongs_to :stadiums

	enum type_transaction: { sale: 0, add_stock: 1 }

	validates :n_beers, presence: true, numericality: { only_integer: true }
	validates :type_transaction, presence: true
	validates :price, presence: true, numericality: { only_integer: true }

	scope :salesAddDate, lambda{ |date_start,date_end| where("created_at BETWEEN ? AND ? AND type_transaction =1", date_start,date_end) }
	scope :salesSoldDate, lambda{ |date_start,date_end| where("created_at BETWEEN ? AND ? AND type_transaction =0", date_start,date_end) }

end

