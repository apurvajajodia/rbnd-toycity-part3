
#require_relative "product"

class Transaction
	@@transactions = []
	@@count = 0
	attr_accessor :customer, :product, :id

	def initialize(name, product)
		@customer = name
		@product = product
		@@transactions << self
		@@count = @@count + 1
		@id = @@count
		@product.stock = @product.stock - 1

	end


end


