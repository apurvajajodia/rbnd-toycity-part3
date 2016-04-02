
class Customer
	@@customers = []
	attr_accessor :name

	def initialize(string = {})
		@name = string[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(string)
		@@customers.each do |i|
			if(i.name == string)
			puts "found it!" #This is so that the user can know that the program found what he was looking for
			return i
			end
		end
	end	



	private
	def add_to_customers
			@@customers.each do |i|
				if (i.name == @name)
					puts "inside if of customer"
					raise DuplicateCustomerError, "#{@name} already exists"
				end
			end	
		puts "Inside customer else"
		@@customers << self
	end


end