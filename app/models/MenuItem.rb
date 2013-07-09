class MenuItem
	include Dynamoid::Document

	field :name
	field :description
	

	belongs_to :menu_section
	has_many :menu_prices
end