class IndicesController < ApplicationController
    def index
	    @racoes = Produto.find(:all, :conditions => ["tipo_prod='alimento'"])
		@med = Produto.find(:all, :conditions => ["tipo_prod='medicamento'"])
		@acessorio = Produto.find(:all, :conditions => ["tipo_prod='acessorio'"])
	end
	
	def login
		sub = params[:login][0..1]
		sub2 = params[:login][3..params[:login].length-1]
		
		if sub=='ad'
		    a = Administrador.find(:first, :conditions => ["cpf=? and senha=?", sub2, params[:senha]])
		else
			c = Cliente.find(:first, :conditions => ["cpf=? and senha=?", params[:login], params[:senha]])
		end
		
		if c.nil? and a.nil?
			flash[:notice] = "Login ou senha incorretos"
			redirect_to "/"
		else 
			if sub!='ad'
				session[:usuario_id] = c.id
				session[:tipo_user] = 'cliente'
				
				p = Pedido.find(:first, :conditions => ["estado='aberto' and cliente_id=?", session[:usuario_id]])
				if p.nil?
					@pedido = Pedido.new
					@pedido.estado="aberto"
					@pedido.cliente_id=c.id
					@pedido.save
					session[:pedido_atual]=@pedido.id
				else
				    session[:pedido_atual]=p.id
				end
				
				redirect_to "/dados_cliente"
			else
			    session[:usuario_id] = a.id
				session[:tipo_user] = 'admin'
				redirect_to "/"
			end
		end
	end
	
	def logout 
	    session[:usuario_id] = ''
		session[:tipo_user] = ''
		redirect_to "/"
	end
	
	def autenticacao
	
	end
	
	def alimento
	
		@racoes = Produto.find(:all, :conditions => ["tipo_prod='alimento'"])
	    
	end
	
	def medicamento
	
		@med = Produto.find(:all, :conditions => ["tipo_prod='medicamento'"])
	    
	end
	
	def acessorio
	
		@ace = Produto.find(:all, :conditions => ["tipo_prod='acessorio'"])
	    
	end
	
end
