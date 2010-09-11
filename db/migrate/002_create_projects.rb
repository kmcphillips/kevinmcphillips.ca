migration 2, :create_projects do
  up do
    create_table :projects do
      column :id, DataMapper::Property::Integer, :serial => true
      column :name, DataMapper::Property::String
      column :description, DataMapper::Property::Text
      column :url, DataMapper::Property::String
      column :source_url, DataMapper::Property::String
      column :img, DataMapper::Property::String
    end
  end

  down do
    drop_table :projects
  end
end

