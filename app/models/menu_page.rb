class MenuPage < ActiveRecord::Base
  attr_accessible :info, :tab, :title, :menu_columns_attributes

  has_many :menu_columns, dependent: :destroy

  accepts_nested_attributes_for :menu_columns, allow_destroy: true

  def infos
  	return self.info.blank? ? [] : self.info.split('<br/>')
  end

  def first_section_infos
  	result = ''
  	self.menu_columns.each do |menu_column|
  		if (menu_column.menu_sections.length && !menu_column.menu_sections[0].info.blank?)
  			result = '&nbsp;'
  			break
  		end
  	end
  	return result
  end
end
