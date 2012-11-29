# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121028160953) do

  create_table "administradors", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "identidade"
    t.string   "senha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "identidade"
    t.string   "sexo"
    t.date     "data_nasc"
    t.string   "telefone"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enderecos", :force => true do |t|
    t.string   "nome"
    t.string   "cep"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "info_ref"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "cliente_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "quantidade"
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pagamentos", :force => true do |t|
    t.string   "tipo"
    t.string   "bandeira_card"
    t.string   "nome_card"
    t.string   "numero_card"
    t.string   "validade_card"
    t.string   "codSecure_card"
    t.integer  "num_parcela_card"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "pedido_id"
  end

  create_table "pedidos", :force => true do |t|
    t.float    "valor_total"
    t.string   "estado"
    t.integer  "cliente_id"
    t.integer  "endereco_id"
    t.integer  "pagamento_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.float    "preco"
    t.string   "descricao"
    t.integer  "quant_esto"
    t.string   "tipo_prod"
    t.string   "marca"
    t.float    "peso"
    t.string   "tipo_animal"
    t.string   "tipo_med"
    t.string   "dosagem"
    t.string   "tipo_adm"
    t.string   "tamanho"
    t.string   "tipo_ace"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
