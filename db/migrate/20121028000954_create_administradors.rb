class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.string :nome
      t.string :cpf
      t.string :identidade
      t.string :senha

      t.timestamps
    end
  end
end
