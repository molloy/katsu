class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.belongs_to :menu_column
      t.string :title
      t.string :info

      t.timestamps
    end
  end
end
