class MenuPrice
	include Dynamoid::Document

	field :name
	field :price, :float

	belongs_to :menu_item
end