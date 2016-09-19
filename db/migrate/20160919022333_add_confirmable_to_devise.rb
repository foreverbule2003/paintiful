class AddConfirmableToDevise < ActiveRecord::Migration
  def change
      add_column :users, :confirmation_token, :string, unique: true
      add_column :users, :confirmed_at, :datetime
      add_column :users, :confirmation_sent_at, :datetime
      add_column :users, :unconfirmed_email, :string # Only if using reconfirmable

  end
end