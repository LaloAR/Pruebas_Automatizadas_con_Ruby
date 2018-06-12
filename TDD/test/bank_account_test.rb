require "minitest/autorun"
require "../bank_account"
require "factory_girl"

FactoryGirl.find_definitions

class BankAccountTest < Minitest::Test
	include FactoryGirl::Syntax::Methods

	def setup
		@account = build(:bank_account)
	end

	def test_bank_account_is_not_nil
		refute_nil @account
	end

	def test_account_has_a_whitdraw_method
		# Prueba que tengamos una manera de retirar de la cuenta
		assert @account.respond_to?(:whitdraw)
	end

	def test_account_has_a_deposit_method
		# Prueba que tengamos una manera de depositar a la cuenta
		assert @account.respond_to?(:deposit)
	end

	def test_whitdraw_removes_money_from_account
		# Al mandar a llamar retirar, se resta el dinero indicado de la cuenta
		@account.whitdraw(100)
		assert_equal 100, @account.amount
	end

	def test_deposit_adds_money_into_account
		# Al mandar a llamar a depositar, se suma el dinero indicado a la cuenta
		@account.deposit(100)
		assert_equal 300, @account.amount
	end

	def test_cant_whitdraw_money_that_is_has
		# No podemos retirar más dinero del que tenemos en nuestra cuenta
		assert_raises ArgumentError do
			@account.whitdraw(300)
		end
	end

	def test_initial_value_for_bank_account
		# Test que podemos asignar un valor inicial al crear una cuenta de banco
		assert_equal @account.amount, 200
	end

	def test_can_assign_a_name_to_bank_account
		@account.name = "Mi cuenta de banco"
		assert_equal "Mi cuenta de banco", @account.name
	end

	def test_name_should_contain_at_least_two_words
		assert_raises ArgumentError do
			@account.name("dsadsadas")
		end
	end
end