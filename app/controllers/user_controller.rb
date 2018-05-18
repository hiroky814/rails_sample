class UserController < ApplicationController
  def index
    @user_list = []
  end

  def read
    @name = params[:name]
    @user_list = []
    if @name.empty?
      @user_list = User.all
    else
      @user_list = User.where("name like '%" + @name + "%'")
    end
    render "index"
  end
end
