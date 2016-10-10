class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
