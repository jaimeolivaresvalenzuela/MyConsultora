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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170605191026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cliente", primary_key: "cliid", force: :cascade do |t|
    t.string  "clinombre",        limit: 50
    t.string  "clirazonsocial",   limit: 50
    t.string  "clidireccion",     limit: 50
    t.decimal "clirut"
    t.string  "clidv",            limit: 1
    t.string  "cliestado",        limit: 20
    t.date    "clifechacreacion"
  end

  create_table "comentario", primary_key: "comid", force: :cascade do |t|
    t.integer "ettaid"
    t.integer "proid"
    t.integer "pretid"
    t.text    "comcomentario"
    t.string  "comestado",        limit: 20
    t.date    "comfechacreacion"
  end

  add_index "comentario", ["comid"], name: "comentario_pk", unique: true, using: :btree
  add_index "comentario", ["ettaid"], name: "relationship_20_fk", using: :btree
  add_index "comentario", ["pretid"], name: "relationship_21_fk", using: :btree
  add_index "comentario", ["proid"], name: "relationship_22_fk", using: :btree

  create_table "contacto", primary_key: "conid", force: :cascade do |t|
    t.integer "cliid"
    t.string  "connombre",          limit: 30
    t.string  "conapellidopaterno", limit: 30
    t.string  "conapellidomaterno", limit: 30
    t.string  "concargo",           limit: 30
    t.decimal "contelefono"
    t.string  "conmail",            limit: 30
    t.string  "conestado",          limit: 20
    t.date    "confechacreacion"
  end

  add_index "contacto", ["cliid"], name: "relationship_13_fk", using: :btree
  add_index "contacto", ["conid"], name: "contacto_pk", unique: true, using: :btree

  create_table "cuenta", primary_key: "cueid", force: :cascade do |t|
    t.integer "ropeid"
    t.integer "cliid"
    t.string  "cuenombre",        limit: 30
    t.string  "cueestado",        limit: 20
    t.date    "cuefechacreacion"
  end

  add_index "cuenta", ["cliid"], name: "relationship_5_fk", using: :btree
  add_index "cuenta", ["cueid"], name: "cuenta_pk", unique: true, using: :btree
  add_index "cuenta", ["ropeid"], name: "relationship_17_fk", using: :btree

  create_table "etapa", primary_key: "etaid", force: :cascade do |t|
    t.string "etanombre",        limit: 30
    t.string "etaestado",        limit: 20
    t.date   "etafechacreacion"
  end

  add_index "etapa", ["etaid"], name: "etapa_pk", unique: true, using: :btree

  create_table "etapatarea", primary_key: "ettaid", force: :cascade do |t|
    t.integer "pretid"
    t.integer "tarid"
    t.integer "ropeid"
    t.string  "ettaestado",        limit: 20
    t.date    "ettafechacreacion"
    t.text    "ettadescripcion"
  end

  add_index "etapatarea", ["ettaid"], name: "etapatarea_pk", unique: true, using: :btree
  add_index "etapatarea", ["pretid"], name: "relationship_9_fk", using: :btree
  add_index "etapatarea", ["ropeid"], name: "relationship_16_fk", using: :btree
  add_index "etapatarea", ["tarid"], name: "relationship_10_fk", using: :btree

  create_table "persona", primary_key: "perid", force: :cascade do |t|
    t.decimal "perrut",                        precision: 10
    t.string  "perdv",              limit: 1
    t.string  "pernombre",          limit: 50
    t.string  "perapellidopaterno", limit: 50
    t.string  "perapellidomaterno", limit: 50
    t.date    "perfechanacimiento"
    t.date    "perfechaingreso"
    t.date    "percargo"
    t.string  "perestado",          limit: 20
    t.date    "perfechacreacion"
  end

  add_index "persona", ["perid"], name: "persona_pk", unique: true, using: :btree

  create_table "proyecto", primary_key: "proid", force: :cascade do |t|
    t.integer "ropeid"
    t.integer "cueid"
    t.string  "pronombre",        limit: 50
    t.string  "proestado",        limit: 20
    t.date    "profechacreacion"
    t.text    "prodescripcion"
  end

  add_index "proyecto", ["cueid"], name: "relationship_6_fk", using: :btree
  add_index "proyecto", ["proid"], name: "proyecto_pk", unique: true, using: :btree
  add_index "proyecto", ["ropeid"], name: "relationship_14_fk", using: :btree

  create_table "proyectoetapa", primary_key: "pretid", force: :cascade do |t|
    t.integer "etaid"
    t.integer "ropeid"
    t.integer "proid"
    t.string  "pretestado",        limit: 20
    t.date    "pretfechacreacion"
    t.text    "pretdescripcion"
  end

  add_index "proyectoetapa", ["etaid"], name: "relationship_7_fk", using: :btree
  add_index "proyectoetapa", ["pretid"], name: "proyectoetapa_pk", unique: true, using: :btree
  add_index "proyectoetapa", ["proid"], name: "relationship_8_fk", using: :btree
  add_index "proyectoetapa", ["ropeid"], name: "relationship_15_fk", using: :btree

  create_table "rol", primary_key: "rolid", force: :cascade do |t|
    t.string "rolnombre",        limit: 30
    t.string "rolestado",        limit: 20
    t.date   "rolfechacreacion"
  end

  add_index "rol", ["rolid"], name: "rol_pk", unique: true, using: :btree

  create_table "rolpersona", primary_key: "ropeid", force: :cascade do |t|
    t.integer "perid"
    t.integer "rolid"
    t.string  "ropeestado",        limit: 20
    t.date    "ropefechacreacion"
    t.text    "ropedescripcion"
  end

  add_index "rolpersona", ["perid"], name: "relationship_12_fk", using: :btree
  add_index "rolpersona", ["rolid"], name: "relationship_11_fk", using: :btree
  add_index "rolpersona", ["ropeid"], name: "rolpersona_pk", unique: true, using: :btree

  create_table "tarea", primary_key: "tarid", force: :cascade do |t|
    t.string "tarnombre",        limit: 30
    t.string "tarestado",        limit: 20
    t.date   "tarfechacreacion"
  end

  add_index "tarea", ["tarid"], name: "tarea_pk", unique: true, using: :btree

  add_foreign_key "comentario", "etapatarea", column: "ettaid", primary_key: "ettaid", name: "fk_comentar_relations_etapatar", on_update: :restrict, on_delete: :restrict
  add_foreign_key "comentario", "proyectoetapa", column: "pretid", primary_key: "pretid", name: "fk_comentar_relations_proyecto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "contacto", "cliente", column: "cliid", primary_key: "cliid", name: "fk_contacto_relations_cliente", on_update: :restrict, on_delete: :restrict
  add_foreign_key "cuenta", "cliente", column: "cliid", primary_key: "cliid", name: "fk_cuenta_relations_cliente", on_update: :restrict, on_delete: :restrict
  add_foreign_key "cuenta", "rolpersona", column: "ropeid", primary_key: "ropeid", name: "fk_cuenta_relations_rolperso", on_update: :restrict, on_delete: :restrict
  add_foreign_key "etapatarea", "proyectoetapa", column: "pretid", primary_key: "pretid", name: "fk_etapatar_relations_proyecto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "etapatarea", "rolpersona", column: "ropeid", primary_key: "ropeid", name: "fk_etapatar_relations_rolperso", on_update: :restrict, on_delete: :restrict
  add_foreign_key "etapatarea", "tarea", column: "tarid", primary_key: "tarid", name: "fk_etapatar_relations_tarea", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proyecto", "cuenta", column: "cueid", primary_key: "cueid", name: "fk_proyecto_relations_cuenta", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proyecto", "rolpersona", column: "ropeid", primary_key: "ropeid", name: "fk_proyecto_relations_rolperso", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proyectoetapa", "etapa", column: "etaid", primary_key: "etaid", name: "fk_proyecto_relations_etapa", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proyectoetapa", "proyecto", column: "proid", primary_key: "proid", name: "fk_proyecto_relations_proyecto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proyectoetapa", "rolpersona", column: "ropeid", primary_key: "ropeid", name: "fk_proyecto_relations_rolperso", on_update: :restrict, on_delete: :restrict
  add_foreign_key "rolpersona", "persona", column: "perid", primary_key: "perid", name: "fk_rolperso_relations_persona", on_update: :restrict, on_delete: :restrict
  add_foreign_key "rolpersona", "rol", column: "rolid", primary_key: "rolid", name: "fk_rolperso_relations_rol", on_update: :restrict, on_delete: :restrict
end
