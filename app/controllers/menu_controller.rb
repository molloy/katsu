class MenuController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  
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

  def destroy
    @menu_page = MenuPage.find(params[:id])
    @menu_page.destroy
    redirect_to menu_index_path
  end

  def new
    @menu_page = MenuPage.new
  end

  def create
    @menu_page = MenuPage.new(params[:menu_page])

    if @menu_page.save
      redirect_to menu_path(@menu_page)
    end
  end
end
