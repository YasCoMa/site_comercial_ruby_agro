class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.float :valor_total
      t.string :estado
      t.integer :cliente_id
      t.integer :endereco_id
      t.integer :pagamento_id

      t.timestamps
    end
  end
end
