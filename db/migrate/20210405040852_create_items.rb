class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title              , null: false
      t.text       :text               , null: false
      t.integer    :item_id            , null: false
      t.integer    :category_id        , null: false
      t.integer    :condition_id       , null: false
      t.integer    :postage_id         , null: false
      t.integer    :prefencture_id     , null: false
      t.integer    :shipping_days_id   , null: false
      t.timestamps
    end
  end
end
