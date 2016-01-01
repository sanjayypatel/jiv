class ListingsController < ApplicationController

  def create
    @listing = Listing.find_by(list_id: listing_params[:list_id], item_id: listing_params[:item_id])
    if @listing
      flash[:notice] = "Oops! Already added!"
    else
      @listing = Listing.new(listing_params)
      if @listing.save
        flash[:notice] = "Added!"
      else
        flash[:error] = "Hmm... something went wrong. Try again?"
      end
    end
    redirect_to list_path(listing_params[:list_id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:notice] = "Added!"
    else
      flash[:error] = "Hmm... something went wrong. Try again?"
    end
    redirect_to list_path(listing_params[:list_id])
  end

  private

  def listing_params
    params.require(:listing).permit(:item_id, :list_id)
  end

end