# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_227_140_723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'books', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description', null: false
    t.string 'cover_url', null: false
    t.integer 'genre', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reservations', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'book_id', null: false
    t.date 'returned_on'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.boolean 'is_admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'reservations', 'books'
  add_foreign_key 'reservations', 'users'
end
