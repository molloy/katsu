class CreateMenuPages < ActiveRecord::Migration
  def change
    create_table :menu_pages do |t|
      t.string :title
      t.string :tab
      t.string :info

      t.timestamps
    end
  end
end
