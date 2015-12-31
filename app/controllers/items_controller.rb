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
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = "Saved!"
      redirect_to item_path(@item)
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "Saved!"
      redirect_to item_path(@item)
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
      redirect_to edit_item_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:media_type, :finished_on, :title, :notes, :finished)
  end

end
