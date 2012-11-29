class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quantidade
      t.integer :produto_id
      t.integer :pedido_id

      t.timestamps
    end
  end
end
