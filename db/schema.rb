# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_07_104821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "rue"
    t.string "ville"
    t.integer "code_postal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "citoyens", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "adresse_id"
    t.index ["adresse_id"], name: "index_citoyens_on_adresse_id"
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "nom_etablissement"
    t.string "mot_de_passe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "adresse_id"
    t.index ["adresse_id"], name: "index_etablissements_on_adresse_id"
  end

  create_table "lieus", force: :cascade do |t|
    t.string "nom"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "etablissement_id"
    t.index ["etablissement_id"], name: "index_lieus_on_etablissement_id"
  end

  create_table "medecins", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.integer "inami"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "adresse_id"
    t.string "mot_de_passe"
    t.index ["adresse_id"], name: "index_medecins_on_adresse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "citoyens", "adresses", column: "adresse_id"
  add_foreign_key "etablissements", "adresses", column: "adresse_id"
  add_foreign_key "lieus", "etablissements"
  add_foreign_key "medecins", "adresses", column: "adresse_id"
end
