class AddCounterToPost < ActiveRecord::Migration
  def change
    add_column :posts, :counter, :integer. default: 0
  end
end
