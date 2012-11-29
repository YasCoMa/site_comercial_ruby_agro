class Cliente < ActiveRecord::Base
	
	has_many :pedidos
    has_many :enderecos

	validates_presence_of :nome, :cpf, :identidade, :email, :sexo, :telefone, :senha, :message=> " - é obrigatório!"
	validates_length_of :senha, :in => 6..20, :message => " - deve ter entre 6 e 20 caracteres!"
	validates_confirmation_of :senha, :message=>" - as senhas não conferem! "
	validates_presence_of :senha_confirmation, :message=> " - é obrigatório!"
	validates_numericality_of :cpf, :identidade, :telefone, :only_integer => true, :message=> " - apenas use números!"
	validates_uniqueness_of :email, :cpf, :identidade, :message => " - já existe cliente cadastrado com este valor!"
	
end
