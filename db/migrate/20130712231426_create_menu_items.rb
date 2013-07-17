class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu_section
      t.string :title
      t.string :info

      t.timestamps
    end
  end
end
