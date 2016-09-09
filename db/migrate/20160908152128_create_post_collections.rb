class CreatePostCollections < ActiveRecord::Migration
  def change
    create_table :post_collections do |t|
      t.integer :post_id
      t.timestamps null: false
      t.remove :collection
    end
    remove_column :post_collections, :collection 
  end
end
