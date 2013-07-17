class CreateMenuPrices < ActiveRecord::Migration
  def change
    create_table :menu_prices do |t|
      t.belongs_to :menu_item
      t.string :title
      t.string :price

      t.timestamps
    end
  end
end
