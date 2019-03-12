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


ActiveRecord::Schema.define(version: 2019_03_12_094058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dares", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creator_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_dares_on_category_id"
    t.index ["creator_id"], name: "index_dares_on_creator_id"
  end

  create_table "difficulty_ratings", force: :cascade do |t|
    t.bigint "difficulty_rater_id"
    t.bigint "dare_id"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dare_id"], name: "index_difficulty_ratings_on_dare_id"
    t.index ["difficulty_rater_id"], name: "index_difficulty_ratings_on_difficulty_rater_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.string "event_type"
    t.bigint "event_id"
    t.string "occasion"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type", "event_id"], name: "index_notifications_on_event_type_and_event_id"
    t.index ["friend_id"], name: "index_notifications_on_friend_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dare_id"
    t.datetime "deadline"
    t.boolean "is_achieved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dare_id"], name: "index_participations_on_dare_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "proofs", force: :cascade do |t|
    t.bigint "participation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_proofs_on_participation_id"
  end

  create_table "user_send_dares", force: :cascade do |t|
    t.bigint "dare_id"
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dare_id"], name: "index_user_send_dares_on_dare_id"
    t.index ["recipient_id"], name: "index_user_send_dares_on_recipient_id"
    t.index ["sender_id"], name: "index_user_send_dares_on_sender_id"

  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "facebook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  add_foreign_key "dares", "categories"
  add_foreign_key "difficulty_ratings", "dares"
  add_foreign_key "notifications", "users"
  add_foreign_key "participations", "users"
  add_foreign_key "proofs", "participations"

end
