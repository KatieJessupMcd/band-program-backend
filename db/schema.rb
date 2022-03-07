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

ActiveRecord::Schema[7.0].define(version: 2022_03_07_050229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ensembles", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_ensembles_on_school_id"
  end

  create_table "ensembles_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "ensemble_id", null: false
    t.index ["ensemble_id", "student_id"], name: "index_ensembles_students_on_ensemble_id_and_student_id"
    t.index ["student_id", "ensemble_id"], name: "index_ensembles_students_on_student_id_and_ensemble_id"
  end

  create_table "instrument_inventory_items", force: :cascade do |t|
    t.integer "condition"
    t.date "date_bought"
    t.integer "serial_number"
    t.string "brand"
    t.string "model"
    t.decimal "estimated_value"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_instrument_inventory_items_on_school_id"
  end

  create_table "music_pieces", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.integer "difficulty"
    t.string "composer"
    t.string "arranger"
    t.string "publisher"
    t.string "genre"
    t.boolean "is_hard_copy"
    t.boolean "is_digital"
    t.boolean "is_out_of_print"
    t.decimal "purchase_price"
    t.date "acquisition_date"
    t.integer "serial_number"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_music_pieces_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.integer "lowest_grade"
    t.integer "highest_grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grade"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  add_foreign_key "ensembles", "schools"
  add_foreign_key "instrument_inventory_items", "schools"
  add_foreign_key "music_pieces", "schools"
  add_foreign_key "students", "schools"
end
