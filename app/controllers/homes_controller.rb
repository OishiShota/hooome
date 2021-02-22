class HomesController < ApplicationController
  def index
    @new_homes = Home.includes(:user).order("created_at DESC").limit(5)
    @all_homes = Home.includes(:user).order("created_at DESC")
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      redirect_to home_path(@home.id)
    else
      render :new
    end
  end

  def show
    @home = Home.find(params[:id])
    @message = Message.new
  end

  private
  def home_params
    params.require(:home).permit(:name).merge(user_id: current_user.id)
  end
end

