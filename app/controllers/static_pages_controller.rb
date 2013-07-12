class StaticPagesController < ApplicationController
	@@data = File.read(File.expand_path("../../../public/menu.json", __FILE__))

	def menu
	end

	def menudata
		render json: @@data
	end
end
