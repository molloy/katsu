class MenuPage
	include Dynamoid::Document

	field :name

	has_many :menu_sections
end