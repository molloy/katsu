class CreateMenuColumns < ActiveRecord::Migration
  def change
    create_table :menu_columns do |t|
      t.belongs_to :menu_page
      t.integer :span
      t.integer :cols

      t.timestamps
    end
  end
end
