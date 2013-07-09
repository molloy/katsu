class MenuSection
	include Dynamoid::Document

	field :name

	belongs_to :menu_page
	has_many :menu_items
end