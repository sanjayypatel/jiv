class ListsController < ApplicationController
  def index
    @lists = List.all_public
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
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
  end

  def update
    @list = List.find(params[:id])
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