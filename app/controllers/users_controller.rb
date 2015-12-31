class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @lists = @user.lists
  end

end
