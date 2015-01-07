class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.references :app, index: true
      t.string :name
      t.string :description
      t.text :parameters
      t.text :tags

      t.timestamps null: false
    end
    add_foreign_key :instances, :apps
  end
end
