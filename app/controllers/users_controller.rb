class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    query = "SELECT * FROM homes WHERE user_id = #{(params[:id])} ORDER BY updated_at DESC"
    @user_homes = Home.find_by_sql(query)
    query = "SELECT h.id,h.name,h.user_id,h.created_at,h.updated_at FROM homes h JOIN messages m ON h.id = m.home_id WHERE m.user_id = #{(params[:id])} GROUP BY h.id ORDER BY updated_at DESC;"
    @user_message_homes = Home.find_by_sql(query)
  end
end