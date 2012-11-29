class Pedido < ActiveRecord::Base

    belongs_to :cliente
	belongs_to :endereco
	belongs_to :pagamento
	has_many :items

end
