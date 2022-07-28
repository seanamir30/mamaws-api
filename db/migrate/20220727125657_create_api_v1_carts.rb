class CreateApiV1Carts < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_carts, id: :uuid do |t|
      t.integer :quantity
      t.timestamps
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :api_v1_item, null: false, foreign_key: true, type: :uuid
    end
  end
end
