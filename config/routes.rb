Rails.application.routes.draw do
  get '/' => 'user#index'
  get '/add_user' => 'add_user#index'
  post '/add_user/add' => 'add_user#create'
  get '/search' => 'user#read'
  get '/picture' => 'picture#index'
  get '/regular_update' => 'regular_update#index'
  get '/chartjs' => 'chartjs#index'

  namespace :api do
    namespace :v1 do
      namespace :server_time do
        get '/', action: 'read'
      end
    end
  end
end
