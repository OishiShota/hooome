class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    query = "SELECT * FROM homes WHERE user_id = #{(params[:id])} "
    @user_homes = Home.find_by_sql(query)
  end
end