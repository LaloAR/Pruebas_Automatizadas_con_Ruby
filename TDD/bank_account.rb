class BankAccount
	attr_accessor :amount,:name

	def initialize
	end


	def name=(name)
		raise ArgumentError.new("Name should contain at least two words") unless name =~ /^\w+\s+\w+.*$/
		@name = name
	end

=begin
	def name
		@name
	end
=end

	def whitdraw(amount)
		# Recibe el monto a retirar
		raise ArgumentError.new("Fondos insuficientes") if @amount < amount
		@amount -= amount
	end

	def deposit(amount)
		@amount += amount
	end
end