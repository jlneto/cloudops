class CreateAppComponents < ActiveRecord::Migration
  def change
    create_table :app_components do |t|
      t.references :app, index: true
      t.string :name
      t.string :description
      t.string :type
      t.text :template
      t.text :instructions

      t.timestamps null: false
    end
    add_foreign_key :app_components, :apps
  end
end
