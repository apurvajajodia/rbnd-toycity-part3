
#require_relative "lib/errors"
class Product
	@@products = []
	@@product_in_stock = []
	attr_accessor :title, :price, :stock
	
	def initialize(string = {})
		@title = string[:title] 
		@price = string[:price] 
		@stock = string[:stock] 
		add_to_products
	end	
	def self.all
		@@products
	end

	def self.find_by_title(string)
		@@products.each do |i|
			if(i.title == string)
			puts "found it!" #This is so that the user can know that the program found what he was looking for
			return i
			end
		end
	end	

	def in_stock?
		if @stock > 0
			return true
		else
			return false
		end
	end

	def self.in_stock
	
		@@products.each do |i|
			if(i.stock > 0)
				@@product_in_stock.push(i)
			end
		end
		return @@product_in_stock
	end




	private
	def add_to_products
		@@products.each do |i|
			if(i.title == @title)
			puts "inside if"
			raise DuplicateProductError, "'#{@title}' already exists"
			end
		end	
			puts "inside else"
			@@products << self
	end		



end