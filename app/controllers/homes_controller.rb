class HomesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @new_homes = Home.includes(:user).order("created_at DESC").limit(5)
    @new_comment_homes = Home.includes(:user).order("updated_at DESC").limit(5)
    @all_homes = Home.includes(:user).order("updated_at DESC")
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
    @messages = @home.messages
    @message = Message.new
  end

  def search
    unless params[:keyword] == ""
      @keys = SearchHomesService.search(params[:keyword])
    else
      redirect_to root_path
    end
  end

  private

  def home_params
    params.require(:home).permit(:name).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

