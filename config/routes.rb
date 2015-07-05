Rails.application.routes.draw do
  
  root 'games#index'
  post '/' => 'users#attempt_login'
  get '/register' => 'users#register'
  post '/register' => 'users#create'
  get '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :games do
    member { post :vote }
    collection do
      get '/search' => 'games#index'
    end
    resources :reviews do
      member { post :vote }
    end
  end
  
end
