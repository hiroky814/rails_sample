class UserController < ApplicationController
  def read
    @name = params[:name]
    @user_list = []
    if @name.empty?
      @user_list = User.all
    else
      @user_list = User.where("name like '%" + @name + "%'")
    end
  end
end
