Rails.application.routes.draw do
  get '/' => 'user#index'
  get '/search' => 'user#read'
end
