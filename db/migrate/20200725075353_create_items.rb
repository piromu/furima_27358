class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price_id, null: false
      t.integer :condition_id, null: false
      t.integer :postage_id, null: false
      t.string :image, null: false
      t.string :size
      t.references :customer, null: false, foreign_key: true
      t.bigint :user_id, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
