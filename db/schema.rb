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

ActiveRecord::Schema.define(version: 2022_03_18_044535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "date_time"
    t.text "payment_reference"
    t.string "status", default: "Pending Descision"
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "reason_of_rejections"
    t.index ["service_id"], name: "index_bookings_on_service_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "rams", force: :cascade do |t|
    t.string "ministry_group"
    t.datetime "time_and_date"
    t.string "location"
    t.string "leaders_name"
    t.string "activity"
    t.string "num_of_leaders"
    t.text "risks_description"
    t.text "casual_factors_people"
    t.string "casual_factors_equipment"
    t.text "casual_factors_environment"
    t.text "risk_management_emergency"
    t.text "relevant_industry_standards_applicable"
    t.text "skills_required_by_staff"
    t.string "form_completed_by"
    t.boolean "yes"
    t.boolean "no"
    t.string "approved_by"
    t.string "position_in"
    t.date "submision_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "risk_management_normal_operations_people"
    t.text "risk_management_normal_operations_equipment"
    t.text "risk_management_normal_operations_environment"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "capacity", default: 0
    t.integer "current_usage", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usage_reminder", null: false
    t.decimal "price"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "taps", force: :cascade do |t|
    t.time "in_time"
    t.time "out_time"
    t.integer "usage", default: 0
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_taps_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "contact"
    t.string "address"
    t.string "role", default: "User"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "services"
  add_foreign_key "bookings", "users"
  add_foreign_key "services", "users"
  add_foreign_key "taps", "services"
end
