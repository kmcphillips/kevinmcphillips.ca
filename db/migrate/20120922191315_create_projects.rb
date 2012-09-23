class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :source_url
      t.string :img

      t.timestamps
    end

    add_index :projects, :name
    add_index :projects, :created_at
  end
end
