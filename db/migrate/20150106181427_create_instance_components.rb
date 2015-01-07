class CreateInstanceComponents < ActiveRecord::Migration
  def change
    create_table :instance_components do |t|
      t.references :instance, index: true
      t.references :app_component, index: true
      t.string :name
      t.text :template
      t.string :arn
      t.string :address

      t.timestamps null: false
    end
    add_foreign_key :instance_components, :instances
    add_foreign_key :instance_components, :app_components
  end
end
