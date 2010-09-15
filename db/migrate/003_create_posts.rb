migration 3, :create_posts do
  up do
    create_table :posts do
      column :id, DataMapper::Property::Integer, :serial => true
      column :title, DataMapper::Property::String
      column :body, DataMapper::Property::Text
      column :permalink, DataMapper::Property::String
      column :created_at, DataMapper::Property::DateTime
    end

    create_index :posts, :permalink
    create_index :posts, :created_at
  end

  down do
    drop_table :posts
  end
end
