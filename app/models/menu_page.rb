class MenuPage < ActiveRecord::Base
  attr_accessible :info, :tab, :title, :menu_columns_attributes

  has_many :menu_columns

  accepts_nested_attributes_for :menu_columns

  def infos
  	return self.info.blank? ? [] : self.info.split('<br/>')
  end
end
