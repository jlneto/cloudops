class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :command
      t.text :output
      t.references :user, index: true
      t.references :instance_component, index: true
      t.boolean :success
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :delayed_job_id

      t.timestamps null: false
    end
    add_foreign_key :jobs, :users
    add_foreign_key :jobs, :instance_components
  end
end
