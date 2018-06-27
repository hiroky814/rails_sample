class AddUserController < ApplicationController
  protect_from_forgery except: :create

  def index
    
  end

  def create
    name = params[:name]
    age = params[:age]
    pref = params[:pref]
    hobby = params[:hobby]
    user = User.new
    user.create(name, age, pref, hobby)

    render 'index'
  end
end
