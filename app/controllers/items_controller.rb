class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to items_path 
    else 
      redirect_to items_new_path 
    end
  end

  def edit
    @item = Item.new
  end

  def update
    @item = Item.new(items_params)
    if @item.save
      redirect_to items_path   
    else
      redirect_to items_edit_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :location, :price, :picture)
  end
  
end
