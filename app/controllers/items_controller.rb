class ItemsController < ApplicationController
  before_filter :verificar_tudo, :only => [:index, :new, :show]
  before_filter :verificar_cliente, :only => [:addProduct]
  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
	
	
    @item = Item.find(params[:id])
	
	pr = Produto.find(:first, :conditions => ["id=?", @item.produto_id])
	if pr.quant_esto < Integer(params[:item][:quantidade])
		flash[:notice]="Esta quantidade não está disponível!"
	else
		pr.quant_esto -= Integer(params[:item][:quantidade])-1
		pr.save
		
		respond_to do |format|
			if @item.update_attributes(params[:item])
				format.html { redirect_to "/pedidos", notice: "A quantidade foi alterada com sucesso" }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @item.errors, status: :unprocessable_entity }
			end
		end
	end	
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
	
	pr = Produto.find(:first, :conditions => ["id=?", @item.produto_id])
	pr.quant_esto+=@item.quantidade
	pr.save
	
    @item.destroy

    respond_to do |format|
      format.html { redirect_to "/pedidos" }
      format.json { head :no_content }
    end
  end
  
  def addProduct
	if session[:usuario_id].nil?
		flash[:notice]="Faça o login para comprar"
	    redirect_to "/autenticacao"
	else
		i = Item.find(:first, :conditions => ["pedido_id=? and produto_id=?", session[:pedido_atual], params[:id]])
		if i.nil?
			@item=Item.new
			@item.pedido_id=session[:pedido_atual]
			@item.produto_id=params[:id]
			@item.quantidade=1
			
			pr = Produto.find(:first, :conditions => ["id=?", @item.produto_id])
			pr.quant_esto-=1;
			
			if pr.quant_esto>=0
				pr.save
				
				@item.save
				redirect_to "/pedidos"
			else
				flash[:notice]="Este produto está indisponível!"
				redirect_to "/"
			end	
		else
			flash[:notice]="Você já colocou este produto no carrinho!"
			redirect_to "/"
		end
	end
  end
  
end
