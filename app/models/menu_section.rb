class MenuSection < ActiveRecord::Base
  attr_accessible :info, :title, :menu_column

  belongs_to :menu_column
  has_many :menu_items

  accepts_nested_attributes_for :menu_items
end
