class PagamentosController < ApplicationController
  
  before_filter :verificar_cliente, :only => [ :new, :edit]
  before_filter :verificar_administrador, :only => [:index]
  
  # GET /pagamentos
  # GET /pagamentos.json
  def index
    @pagamentos = Pagamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamentos }
    end
  end

  # GET /pagamentos/1
  # GET /pagamentos/1.json
  def show
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/new
  # GET /pagamentos/new.json
  def new
    @pagamento = Pagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/1/edit
  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  # POST /pagamentos
  # POST /pagamentos.json
  def create
    @pagamento = Pagamento.new(params[:pagamento])
	@pagamento.pedido_id=session[:pedido_atual]
	
	respond_to do |format|
      if @pagamento.save
		p = Pedido.find(session[:pedido_atual])
		p.pagamento_id=@pagamento.id
		p.estado="pagando"
		p.save
		
		p2 = Pedido.new
		p2.estado="aberto"
		p2.cliente_id=session[:usuario_id]
		p2.save
		session[:pedido_atual]=p2.id
		
        format.html { redirect_to "/pedidos", notice: 'Seu pedido foi finalizado, acompanhe-o no seu quadro de pedidos. Aguardamos a confirmação deste pagamento. \nO número dele é ' + p.id + '.' }
        format.json { render json: @pagamento, status: :created, location: @pagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pagamentos/1
  # PUT /pagamentos/1.json
  def update
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        format.html { redirect_to @pagamento, notice: 'Pagamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.json
  def destroy
    @pagamento = Pagamento.find(params[:id])
    @pagamento.destroy

    respond_to do |format|
      format.html { redirect_to pagamentos_url }
      format.json { head :no_content }
    end
  end
end
