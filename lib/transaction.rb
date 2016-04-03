
#require_relative "product"

class Transaction
	@@transactions = []
	@@count = 0
	attr_accessor :customer, :product, :id

	def initialize(name, product)
		@customer = name
		@product = product
		make_purchase

	end

	def self.all
		@@transactions
	end

	def self.find(id_no)
		@@transactions.each do |i|
			if(i.id == id_no)
			return i
			end
		end
	end	

	private
	def make_purchase
		if (@product.stock > 0) then
			@@transactions << self
			@@count = @@count + 1
			@id = @@count
			@product.stock = @product.stock - 1
		else
			raise OutOfStockError, "#{@product.title} is out of stock"
		end
	end


end


