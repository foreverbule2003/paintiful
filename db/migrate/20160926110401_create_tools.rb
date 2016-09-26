class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.belongs_to :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :tools, :posts
  end
end
