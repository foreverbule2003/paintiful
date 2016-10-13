class RemoveVoteFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :vote, :integer
  end
end
