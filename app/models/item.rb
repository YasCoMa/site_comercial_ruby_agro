class Item < ActiveRecord::Base

    belongs_to :pedido
	belongs_to :produto
	
	validates_presence_of :quantidade, :message=> " - é obrigatório!"
	validates_numericality_of :quantidade, :only_integer => true, :message=> " - apenas use números inteiros!"
	
end
