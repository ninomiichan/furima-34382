class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :priice
      t.integer :category_id
      t.integer :condition_id
      t.integer :postage_id
      t.integer :prefecture_id
      t.integer :shippind_days
      t.string :user
      t.timestamps
    end
  end
end
