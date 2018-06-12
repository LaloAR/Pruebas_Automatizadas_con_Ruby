require 'minitest/autorun'

def nombre
	"Lalo"
end

class TestNombre < MiniTest::Test
	def test_nombre_returns_lalo
		assert_equal "Lalo",nombre
	end
end