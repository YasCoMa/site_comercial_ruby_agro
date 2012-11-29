class Produto < ActiveRecord::Base

    has_many :items
	
	validates_presence_of :nome, :preco, :descricao, :quant_esto, :message=> " - é obrigatório!"
	validates_numericality_of :preco, :message=> " - deve ser um número."
	validates_numericality_of :quant_esto, :only_integer=> true, :message=> " - deve ser um número inteiro."
	
end
