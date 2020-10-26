class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @item = Item.all
  end

  def new
    if signed_in?
      @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :exposition, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
