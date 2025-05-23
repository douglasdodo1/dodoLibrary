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

ActiveRecord::Schema[8.0].define(version: 2025_05_22_211502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", primary_key: "cep", id: :string, force: :cascade do |t|
    t.string "street"
    t.string "neighborhood"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_genres", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_genres_on_book_id"
    t.index ["genre_id"], name: "index_book_genres_on_genre_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "isbn"
    t.string "edition"
    t.integer "pages"
    t.integer "quantity"
    t.decimal "price"
    t.string "shelf_location"
    t.text "summary"
    t.date "release_date"
    t.date "acquisition_date"
    t.string "cover_image_url"
    t.bigint "author_id", null: false
    t.bigint "publisher_id", null: false
    t.bigint "language_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["language_id"], name: "index_books_on_language_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
    t.index ["status_id"], name: "index_books_on_status_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "user_cpf", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_cpf"], name: "index_clients_on_user_cpf"
  end

  create_table "employees", force: :cascade do |t|
    t.string "user_cpf", null: false
    t.string "status"
    t.decimal "salary"
    t.string "role"
    t.string "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_cpf"], name: "index_employees_on_user_cpf"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.string "user_cpf", null: false
    t.bigint "book_id", null: false
    t.date "loan_date"
    t.date "return_date"
    t.boolean "returned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["user_cpf"], name: "index_loans_on_user_cpf"
  end

  create_table "phones", force: :cascade do |t|
    t.string "user_cpf", null: false
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_cpf"], name: "index_phones_on_user_cpf"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "user_cpf", null: false
    t.string "address_cep", null: false
    t.string "number"
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_cep"], name: "index_user_addresses_on_address_cep"
    t.index ["user_cpf"], name: "index_user_addresses_on_user_cpf"
  end

  create_table "users", primary_key: "cpf", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "book_genres", "books"
  add_foreign_key "book_genres", "genres"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "languages"
  add_foreign_key "books", "publishers"
  add_foreign_key "books", "statuses"
  add_foreign_key "cities", "states"
  add_foreign_key "clients", "users", column: "user_cpf", primary_key: "cpf", on_delete: :cascade
  add_foreign_key "employees", "users", column: "user_cpf", primary_key: "cpf", on_delete: :cascade
  add_foreign_key "loans", "books"
  add_foreign_key "loans", "users", column: "user_cpf", primary_key: "cpf", on_delete: :cascade
  add_foreign_key "phones", "users", column: "user_cpf", primary_key: "cpf", on_delete: :cascade
  add_foreign_key "user_addresses", "addresses", column: "address_cep", primary_key: "cep", on_delete: :cascade
  add_foreign_key "user_addresses", "users", column: "user_cpf", primary_key: "cpf", on_delete: :cascade
end
