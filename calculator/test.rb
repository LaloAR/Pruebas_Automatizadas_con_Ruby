require 'minitest/autorun'

require './calculator'

class TestCalculator < MiniTest::Test
	def setup
		@calculator = Calculator.new(5,2)
	end

	# Todos los métodos que tengan afirmaciones inician con test_
	def test_sum_adds_both_numbers
		# expectativa, resultado, mensaje cuando la prueba falla
		assert_equal 7, @calculator.suma(), "La suma no dió el resultado esperado"
	end

	def test_dividir_retorna_la_division_entre_ambos_numbers
		# expectativa, resultado, mensaje cuando la prueba falla
		assert_equal 2.5, @calculator.dividir(), "La división no dió el resultado esperado"
	end

	def test_dividir_retorna_un_flotante
		# clase, objeto de la clase
		assert_instance_of Float, @calculator.dividir()
	end

	def test_dividir_arroja_error_si_zero
		assert_raises ZeroDivisionError do
			@calculator.y = 0
			@calculator.dividir()
		end
	end

	def test_calculator_deberia_responder_a_multiplicar
		assert_respond_to @calculator, :multiplicar
	end

	def test_multiplicar_deberia_funcionar
		skip "No se ha implementado"
	end
end