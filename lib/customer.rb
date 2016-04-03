
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
			return i
			end
		end
	end	

	def purchase(toy)
		Transaction.new(@name, toy)
	end


	private
	def add_to_customers
			@@customers.each do |i|
				if (i.name == @name)
					raise DuplicateCustomerError, "#{@name} already exists"
				end
			end	
		@@customers << self
	end


end