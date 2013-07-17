class MenuPrice < ActiveRecord::Base
  attr_accessible :price, :title, :menu_item

  belongs_to :menu_item
end
