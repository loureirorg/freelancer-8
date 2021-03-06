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

ActiveRecord::Schema.define(version: 20150509014628) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "facebook_name"
    t.string   "facebook_photo_link"
    t.string   "facebook_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "google_name"
    t.text     "google_photo_link"
    t.text     "google_id"
    t.string   "name"
    t.string   "photo_link"
    t.string   "linkedin_name"
    t.string   "linkedin_id"
    t.string   "linkedin_photo_link"
    t.string   "email"
    t.string   "hotmail_name"
    t.string   "hotmail_id"
    t.string   "hotmail_photo_link"
    t.string   "yahoo_name"
    t.string   "yahoo_id"
    t.string   "yahoo_photo_link"
    t.string   "twitter_name"
    t.string   "twitter_id"
    t.string   "twitter_photo_link"
    t.string   "twitter_profile_link"
  end

  add_index "contacts", ["name"], name: "index_contacts_on_name"
  add_index "contacts", ["user_id", "facebook_name"], name: "index_contacts_on_user_id_and_facebook_name"
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "facebook_uid"
    t.string   "google_uid"
    t.text     "google_user_data"
    t.text     "google_contacts_data"
    t.string   "linkedin_uid"
    t.text     "linkedin_user_data"
    t.text     "linkedin_contacts_data"
    t.string   "hotmail_uid"
    t.text     "hotmail_user_data"
    t.text     "hotmail_contacts_data"
    t.string   "yahoo_uid"
    t.text     "yahoo_user_data"
    t.text     "yahoo_contacts_data"
    t.string   "twitter_uid"
    t.text     "twitter_user_data"
    t.text     "twitter_contacts_data"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
