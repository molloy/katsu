class MenuColumn < ActiveRecord::Base
  attr_accessible :span, :cols, :menu_page

  belongs_to :menu_page
  has_many :menu_sections

  accepts_nested_attributes_for :menu_sections

  def cols
  	return read_attribute(:cols).nil? ? 1 : read_attribute(:cols)
  end
end
