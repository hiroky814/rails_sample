Rails.application.routes.draw do
  get '/' => 'user#index'
  get '/user' => 'user#index'
  get '/user/search' => 'user#read'
  get '/user/regist' => 'user#create'
end
