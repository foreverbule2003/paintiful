class AddVoteToPost < ActiveRecord::Migration
  def change
    add_column :posts, :vote, :integer
  end
end
