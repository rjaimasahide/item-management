class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.integer :storage_id
      t.integer :image_id
      t.integer :amount
      t.detetime :deadline
      t.string :owner
      t.boolean :purchase_status, default: false, null: false

      t.timestamps
    end
  end
end
