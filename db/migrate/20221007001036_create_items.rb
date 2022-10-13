class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.integer :storage_id
      t.text :comment
      t.string :image_id
      t.integer :amount
      t.date :deadline
      t.string :owner
      t.boolean :deleted_at, default: false, null: false
      t.boolean :purchase_status, default: false, null: false

      t.timestamps
    end
  end
end
