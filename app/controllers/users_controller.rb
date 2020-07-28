class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @uses = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
end
