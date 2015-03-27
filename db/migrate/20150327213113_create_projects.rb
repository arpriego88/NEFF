class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.datetime :due_date
      t.references :vendor, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects, :vendors
  end
end
