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

ActiveRecord::Schema.define(version: 20180426013455) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "legal_number"
    t.string "web_page"
    t.string "address"
    t.string "phone_number"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "position"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contacts_on_client_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "title"
    t.datetime "meetDate"
    t.boolean "isVirtual"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_meetings_on_client_id"
  end

  create_table "meetings_users", id: false, force: :cascade do |t|
    t.integer "meeting_id"
    t.integer "user_id"
    t.index ["meeting_id"], name: "index_meetings_users_on_meeting_id"
    t.index ["user_id"], name: "index_meetings_users_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.string "reporter"
    t.string "status"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_tickets_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.boolean "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
