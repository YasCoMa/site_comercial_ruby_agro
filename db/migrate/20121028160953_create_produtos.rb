class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :preco
      t.string :descricao
      t.integer :quant_esto
      t.string :tipo_prod
      t.string :marca
      t.float :peso
      t.string :tipo_animal
      t.string :tipo_med
      t.string :dosagem
      t.string :tipo_adm
      t.string :tamanho
      t.string :tipo_ace

      t.timestamps
    end
  end
end
