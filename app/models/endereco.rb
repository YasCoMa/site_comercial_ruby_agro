class Endereco < ActiveRecord::Base

    belongs_to :cliente
	has_many :pedidos
	
	validates_presence_of :nome, :cep, :logradouro, :numero, :info_ref, :bairro, :cidade, :estado, :message=> " - é obrigatório!"
	validates_numericality_of :cep, :numero,  :only_integer => true, :message=> " - apenas use números!"
	
end
