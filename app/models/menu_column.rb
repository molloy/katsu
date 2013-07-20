class MenuColumn < ActiveRecord::Base
  attr_accessible :span, :cols, :menu_page, :menu_sections_attributes

  belongs_to :menu_page
  has_many :menu_sections, dependent: :destroy

  accepts_nested_attributes_for :menu_sections, allow_destroy: true

  def cols
  	return read_attribute(:cols).nil? ? 1 : read_attribute(:cols)
  end
end
