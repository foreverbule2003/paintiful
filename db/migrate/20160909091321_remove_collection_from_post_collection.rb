class RemoveCollectionFromPostCollection < ActiveRecord::Migration
  def change
    remove_column :post_collections, :collection, :integer
  end
end
