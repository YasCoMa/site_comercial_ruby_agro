class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :nome
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :info_ref
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.integer :cliente_id

      t.timestamps
    end
  end
end
