class EnderecosController < ApplicationController
  
  before_filter :verificar_cliente, :only => [:edit, :update, :destroy]
  before_filter :verificar_administrador, :only => [:index]
  
  # GET /enderecos
  # GET /enderecos.json
  def index
    @enderecos = Endereco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enderecos }
    end
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
	c = Endereco.find(:first, :conditions => ["cliente_id=? and id=?", session[:usuario_id], params[:id]])
    if c.nil?
		flash[:notice]="O acesso a esta url não é permitido."
		redirect_to "/"
	else
		@endereco = Endereco.find(params[:id])
		redirect_to "/dados"
	end
	
    
  end

  # GET /enderecos/new
  # GET /enderecos/new.json
  def new
    @endereco = Endereco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @endereco }
    end
  end

  # GET /enderecos/1/edit
  def edit
	c = Endereco.find(:first, :conditions => ["cliente_id=? and id=?", session[:usuario_id], params[:id]])
    if c.nil?
		flash[:notice]="O acesso a esta url não é permitido."
		redirect_to "/"
	else
		@endereco = Endereco.find(params[:id])
	end
  
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    
    @endereco = Endereco.new(params[:endereco])
	@endereco.cliente_id=session[:usuario_id]
	
    respond_to do |format|
      if @endereco.save
        format.html { redirect_to "/dados", notice: 'O endereço foi cadastrado com sucesso!' }
        format.json { render json: @endereco, status: :created, location: @endereco }
      else
        format.html { render action: "new" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enderecos/1
  # PUT /enderecos/1.json
  def update
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      if @endereco.update_attributes(params[:endereco])
        format.html { redirect_to "/dados", notice: 'O endereço foi alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco = Endereco.find(params[:id])
    @endereco.destroy

    respond_to do |format|
      format.html { redirect_to enderecos_url }
      format.json { head :no_content }
    end
  end
end
