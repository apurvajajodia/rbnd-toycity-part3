
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
		@@product_in_stock
	end

	def self.out_stock
		@@products.each do |i|
			if(i.stock == 0)
				puts "The below items are out of stock, please consider replenishing"
				puts "#{i.title}"
			end
		end
		
	end

	def self.low_stock
		@@products.each do |i|
			if(i.stock >0 && i.stock < 5)
				puts "The below items are low on stock, please consider replenishing"
				puts "#{i.title}"
			end
		end
		
	end




	private
	def add_to_products
		@@products.each do |i|
			if(i.title == @title)
			raise DuplicateProductError, "'#{@title}' already exists"
			end
		end	
			@@products << self
	end		



end