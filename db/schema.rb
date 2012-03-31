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

ActiveRecord::Schema.define(:version => 20111227002816) do

  create_table "blacklists", :force => true do |t|
    t.string   "ip"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flags", :force => true do |t|
    t.integer  "multa_id"
    t.integer  "motivo"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["multa_id"], :name => "index_flags_on_multa_id"

  create_table "multas", :force => true do |t|
    t.text     "descricao"
    t.string   "placa"
    t.string   "video"
    t.datetime "data_ocorrencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.boolean  "hidden",            :default => false, :null => false
    t.integer  "likes",             :default => 0,     :null => false
    t.string   "creator_ip"
  end

end
