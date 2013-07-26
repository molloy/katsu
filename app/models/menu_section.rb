class MenuSection < ActiveRecord::Base
  attr_accessible :info, :title, :price_headers, :menu_column, :menu_items_attributes

  belongs_to :menu_column
  has_many :menu_items, dependent: :destroy

  accepts_nested_attributes_for :menu_items, allow_destroy: true

  def info_or_blank
  	return self.info.blank? ? self.menu_column.menu_page.first_section_infos : self.info
  end

  def span
  	return self.menu_column.span - self.price_headers
  end
end
