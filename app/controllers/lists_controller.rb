class ListsController < ApplicationController
  def index
    if current_user.present?
      @lists = List.public_or_owned(current_user)
    else
      @lists = List.all_public
    end
    authorize @lists
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @items = @list.items
    if params[:search] && current_user
      query = params[:search]
      @found_items = Item.where("title like ?", "%#{query}%").excluding(@items)
    end
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = current_user.lists.build(list_params)
    authorize @list
    if @list.save
      flash[:notice] = "Saved!"
      redirect_to list_path(@list)
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update_attributes(list_params)
      flash[:notice] = "Saved!"
      redirect_to list_path(@list)
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
      redirect_to edit_list_path(@list)
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :private, :blurb)
  end

end