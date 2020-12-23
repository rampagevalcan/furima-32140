class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :search_product, only: [:index, :search]
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @p = Item.ransack(params[:q])
    set_product_column
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @p = Item.ransack(params[:q])
    set_product_column
  end

  def edit
    unless current_user.id == @item.user.id && @item.purchase_record.blank?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    # @results = @p.result
    @p = Item.ransack(params[:q])
    @results = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_condition_id, :shopping_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_product
    @p = Item.ransack(params[:q])
  end

  def set_product_column
    @item_name = Item.select("item_name").distinct
  end
end
