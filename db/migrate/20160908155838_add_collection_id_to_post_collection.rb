class AddCollectionIdToPostCollection < ActiveRecord::Migration
  def change
    add_column :post_collections, :collection_id, :integer
  end
end
