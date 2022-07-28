class CreateApiV1Carts < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_carts, id: :uuid do |t|
      t.integer :quantity
      t.belongs_to :users, null: false, foreign_key: true, type: :uuid
      t.belongs_to :api_v1_items, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_reference :users, :api_v1_carts, index: true, type: :uuid
  end
end
