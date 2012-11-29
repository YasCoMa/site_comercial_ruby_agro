class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :identidade
      t.string :sexo
      t.date :data_nasc
      t.string :telefone
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
