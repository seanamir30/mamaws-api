class CreateApiV1Items < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_items, id: :uuid do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :quantity
      t.integer :sold

      t.timestamps
    end
  end
end
