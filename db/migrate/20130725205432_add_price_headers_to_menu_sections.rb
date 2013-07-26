class AddPriceHeadersToMenuSections < ActiveRecord::Migration
  def change
    add_column :menu_sections, :price_headers, :integer, default: 0
  end
end
