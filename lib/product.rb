
class Product
	@@products = []
	attr_accessor :title, :price, :stock
	all = Array.new
	def initialize(string = {})
		@@products << self
		@title = string[:title] 
		@price = string[:price] 
		@stock = string[:stock] 
	end	
	def self.all
		@@products
	end
end