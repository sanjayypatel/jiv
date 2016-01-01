class ItemsController < ApplicationController
  def index
    if current_user
      @items = current_user.items
      authorize @items
    else
      @items = nil
    end
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = current_user.items.build(item_params)
    authorize @item
    puts params
    if @item.save
      if params[:list_id]
        @list = List.find(params[:list_id])
        @listing = Listing.new(
          list: @list,
          item: @item
        )
        @listing.save
      end
      flash[:notice] = "Saved!"
      if params[:list_id]
        redirect_to list_path(params[:list_id])
      else
        redirect_to item_path(@item)
      end
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
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
    params.require(:item).permit(:media_type, :finished_on, :title, :blurb, :finished)
  end

end
