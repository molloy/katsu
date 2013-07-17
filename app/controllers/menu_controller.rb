class MenuController < ApplicationController
  def index
  	@menu_pages = MenuPage.all()
  end

  def show
  	@menu_page = MenuPage.find(params[:id])
  end

  def edit
  	@menu_page = MenuPage.find(params[:id])
  end

  def update
  	@menu_page = MenuPage.find(params[:id])

  	if @menu_page.update_attributes(params[:menu_page])
  		flash[:notice] = 'Menu Page was updated successfully'
  		redirect_to menu_path(@menu_page)
  	end
  end
end
