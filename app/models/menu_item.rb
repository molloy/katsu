class MenuItem < ActiveRecord::Base
  attr_accessible :info, :title, :menu_prices_attributes

  belongs_to :menu_section
  has_many :menu_prices, dependent: :destroy

  accepts_nested_attributes_for :menu_prices, allow_destroy: true

  def span
  	(menu_section.menu_column.span.nil? ? 1 : menu_section.menu_column.span) / (menu_section.menu_column.cols.nil? ? 1 : menu_section.menu_column.cols) - (menu_prices.blank? ? 0 : 1)
  end
end
