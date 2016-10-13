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

ActiveRecord::Schema.define(version: 20160401000800) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "agents", force: :cascade do |t|
    t.boolean  "active",               default: false
    t.integer  "role",       limit: 1, default: 0
    t.string   "name",                                 null: false
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["active"], name: "index_agents_on_active"
    t.index ["name"], name: "index_agents_on_name", unique: true
    t.index ["role"], name: "index_agents_on_role"
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.boolean  "published",               default: false
    t.datetime "published_at"
    t.string   "banner"
    t.string   "header",                                  null: false
    t.text     "annotation"
    t.text     "content",                                 null: false
    t.string   "title"
    t.string   "keywords",     limit: 80
    t.string   "description",  limit: 80
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["header"], name: "index_articles_on_header"
    t.index ["published_at"], name: "index_articles_on_published_at"
  end

  create_table "attestats", force: :cascade do |t|
    t.boolean  "active",                 default: false
    t.integer  "status",      limit: 2,  default: 0
    t.string   "number",      limit: 32,                 null: false
    t.text     "object",                                 null: false
    t.date     "issued_at"
    t.date     "closed_at"
    t.integer  "customer_id"
    t.integer  "agent_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["active"], name: "index_attestats_on_active"
    t.index ["agent_id"], name: "index_attestats_on_agent_id"
    t.index ["customer_id"], name: "index_attestats_on_customer_id"
    t.index ["number"], name: "index_attestats_on_number", unique: true
    t.index ["status"], name: "index_attestats_on_status"
  end

  create_table "certificates", force: :cascade do |t|
    t.boolean  "active",                     default: false
    t.integer  "status",          limit: 2,  default: 0
    t.string   "number",          limit: 32,                 null: false
    t.text     "object",                                     null: false
    t.string   "classifier",      limit: 32
    t.string   "classifier_code", limit: 32
    t.string   "grouping",        limit: 32
    t.date     "issued_at"
    t.date     "closed_at"
    t.integer  "customer_id"
    t.integer  "agent_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["active"], name: "index_certificates_on_active"
    t.index ["agent_id"], name: "index_certificates_on_agent_id"
    t.index ["customer_id"], name: "index_certificates_on_customer_id"
    t.index ["number"], name: "index_certificates_on_number", unique: true
    t.index ["status"], name: "index_certificates_on_status"
  end

  create_table "customers", force: :cascade do |t|
    t.boolean  "active",     default: false
    t.string   "name",                       null: false
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["active"], name: "index_customers_on_active"
    t.index ["name"], name: "index_customers_on_name", unique: true
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.boolean  "published",  default: false
    t.integer  "index",      default: 0
    t.string   "logotype"
    t.string   "name",                       null: false
    t.text     "content"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["index"], name: "index_partners_on_index"
    t.index ["name"], name: "index_partners_on_name", unique: true
    t.index ["published"], name: "index_partners_on_published"
  end

  create_table "stages", force: :cascade do |t|
    t.string   "operate",       limit: 2
    t.date     "operate_at",              null: false
    t.string   "operation"
    t.date     "passed_at"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["operate_at"], name: "index_stages_on_operate_at"
    t.index ["resource_type", "resource_id"], name: "index_stages_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_admin",            default: false
    t.boolean  "in_staff",            default: false
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["is_admin", "in_staff"], name: "index_users_on_is_admin_and_in_staff"
  end

end
