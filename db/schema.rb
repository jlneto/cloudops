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

ActiveRecord::Schema.define(version: 20150122212113) do

  create_table "app_components", force: :cascade do |t|
    t.integer  "app_id",       limit: 4
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.string   "type",         limit: 255
    t.text     "template",     limit: 65535
    t.text     "instructions", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "app_components", ["app_id"], name: "index_app_components_on_app_id", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.text     "template",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "github_url",  limit: 255
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "instance_components", force: :cascade do |t|
    t.integer  "instance_id",      limit: 4
    t.integer  "app_component_id", limit: 4
    t.string   "name",             limit: 255
    t.text     "template",         limit: 65535
    t.string   "arn",              limit: 255
    t.string   "address",          limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "instance_components", ["app_component_id"], name: "index_instance_components_on_app_component_id", using: :btree
  add_index "instance_components", ["instance_id"], name: "index_instance_components_on_instance_id", using: :btree

  create_table "instances", force: :cascade do |t|
    t.integer  "app_id",      limit: 4
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.text     "parameters",  limit: 65535
    t.text     "tags",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "instances", ["app_id"], name: "index_instances_on_app_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.text     "command",               limit: 65535
    t.text     "output",                limit: 65535
    t.integer  "user_id",               limit: 4
    t.integer  "instance_component_id", limit: 4
    t.boolean  "success",               limit: 1
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "delayed_job_id",        limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "jobs", ["instance_component_id"], name: "index_jobs_on_instance_component_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "app_components", "apps"
  add_foreign_key "instance_components", "app_components"
  add_foreign_key "instance_components", "instances"
  add_foreign_key "instances", "apps"
  add_foreign_key "jobs", "instance_components"
  add_foreign_key "jobs", "users"
end
