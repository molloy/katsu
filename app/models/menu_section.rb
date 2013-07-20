class MenuSection < ActiveRecord::Base
  attr_accessible :info, :title, :menu_column, :menu_items_attributes

  belongs_to :menu_column
  has_many :menu_items, dependent: :destroy

  accepts_nested_attributes_for :menu_items, allow_destroy: true
end
