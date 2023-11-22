# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_22_182113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_configs", force: :cascade do |t|
    t.boolean "medical_attributes", default: false, null: false
    t.boolean "gender_attribute", default: true, null: false
    t.integer "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "qnt_series"
    t.integer "qnt_repetitions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
  end

  create_table "gym_types", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "email"
    t.integer "gym_type_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "number"
    t.string "neighborhood"
    t.string "complement"
    t.integer "gym_id"
    t.integer "user_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "value"
    t.decimal "amount_paid"
    t.date "payment_date"
    t.date "due_date"
    t.integer "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "begin_date"
    t.string "end_date"
    t.integer "client_id"
    t.text "goal"
    t.string "interval"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.string "number"
    t.integer "gym_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_exercises", force: :cascade do |t|
    t.integer "training_id"
    t.integer "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.integer "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight"
    t.decimal "height"
    t.string "birthdate"
    t.string "begindate"
    t.integer "plan_id"
    t.string "user_type"
    t.integer "gym_id"
    t.string "role"
    t.string "email"
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.boolean "allow_password_change", default: false
    t.string "nickname"
    t.string "image"
    t.json "tokens"
    t.integer "sign_in_count"
    t.time "current_sign_in_at"
    t.time "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "medical_name"
    t.string "medical_address"
    t.string "medical_email"
    t.string "medical_telephone"
    t.string "medical_type"
    t.string "gender"
    t.boolean "deleted", default: false, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
