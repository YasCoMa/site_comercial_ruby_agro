class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.string :tipo
      t.string :bandeira_card
      t.string :nome_card
      t.string :numero_card
      t.string :validade_card
      t.string :codSecure_card
      t.integer :num_parcela_card

      t.timestamps
    end
  end
end
