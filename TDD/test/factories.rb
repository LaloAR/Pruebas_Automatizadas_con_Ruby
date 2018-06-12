require '../bank_account'

FactoryGirl.define do
	# Definimos plantilla para datos falsos

	factory :bank_account do
		# Configuramos el objeto
		amount 200
	end
end