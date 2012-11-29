class AddPedidoIdToPagamentos < ActiveRecord::Migration
  def change
    add_column :pagamentos, :pedido_id, :integer

  end
end
