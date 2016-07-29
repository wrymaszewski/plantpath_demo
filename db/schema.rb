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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160723174121) do

  create_table "bacterial_stocks", force: :cascade do |t|
    t.integer  "number"
    t.string   "wstawka"
    t.string   "sequence_name"
    t.string   "plasmid"
    t.string   "tag"
    t.string   "species"
    t.string   "strain"
    t.string   "antibiotic_resistance"
    t.string   "methods_of_cloning"
    t.string   "source"
    t.text     "comments"
    t.integer  "sequence_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["sequence_id"], name: "index_bacterial_stocks_on_sequence_id"
  end

  create_table "manuals", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "file"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mol_biol_chemicals", force: :cascade do |t|
    t.string   "name"
    t.string   "producer"
    t.string   "catalogue_number"
    t.string   "rodzaj"
    t.string   "quantity"
    t.date     "delivery_date"
    t.string   "place"
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "primers", force: :cascade do |t|
    t.string   "name"
    t.string   "p_sequence"
    t.string   "direction"
    t.integer  "length"
    t.integer  "position"
    t.float    "Tm"
    t.string   "gene_sequence"
    t.text     "comments"
    t.integer  "sequence_id"
    t.boolean  "checked",       default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "regular_chemicals", force: :cascade do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.string   "formula"
    t.string   "producer"
    t.string   "catalogue_number"
    t.date     "delivery_date"
    t.string   "place"
    t.string   "quantity"
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "action"
    t.date     "date_of_action"
    t.text     "comments"
    t.boolean  "done"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sequence_attachments", force: :cascade do |t|
    t.integer  "sequence_id"
    t.string   "sequence_type"
    t.string   "file"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sequences", force: :cascade do |t|
    t.string   "name"
    t.string   "organism"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
