class PedidosController < ApplicationController
  
  before_filter :verificar_administrador,  :only => [:edit]
  before_filter :verificar_tudo, :only => [ :new, :show]
  before_filter :verificar_cliente, :only => [:index, :addEndereco, :addIdEndereco]
  
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.find(:all, :conditions => ["cliente_id=?", session[:usuario_id]])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedidos }
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/new
  # GET /pedidos/new.json
  def new
    @pedido = Pedido.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/1/edit
  def edit
    @pedido = Pedido.find(params[:id])
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(params[:pedido])

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render json: @pedido, status: :created, location: @pedido }
      else
        format.html { render action: "new" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pedidos/1
  # PUT /pedidos/1.json
  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url }
      format.json { head :no_content }
    end
  end
  
  def addEndereco
	@pedido = Pedido.find(session[:pedido_atual])
	if @pedido.items.size==0
		flash[:notice]='Você precisa adicionar pelo menos um produto no pedido!'
		redirect_to "/pedidos"
	else
		
	end
  end
  
  def addIdEndereco
	@pedido = Pedido.find(session[:pedido_atual])
	@pedido.endereco_id=params[:id]
	@pedido.save
	redirect_to "/pagamentos/new"
  end
  
end
