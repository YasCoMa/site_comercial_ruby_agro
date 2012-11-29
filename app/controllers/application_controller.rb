class ApplicationController < ActionController::Base
	protect_from_forgery
  
	def verificar_sessao
        if session[:usuario_id].nil?
		    flash[:notice] = "Por favor, faça o login!"
			redirect_to "/autenticacao"
		end
    end
	
	def verificar_administrador
        if session[:tipo_user]!='admin'
		    flash[:notice] = "Você não tem permissão de administrador!"
			redirect_to "/"
		end
    end
	
	def verificar_cliente
        if session[:tipo_user]!='cliente'
		    flash[:notice] = "Só o cliente pode acessar!"
			redirect_to "/"
		end
    end
	
	def verificar_tudo
        if session[:tipo_user]=='cliente' or session[:tipo_user]=='admin' or session[:tipo_user]==nil
		    flash[:notice] = "Você não tem permissão!"
			redirect_to "/"
		end
    end
	
end
