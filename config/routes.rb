Rails.application.routes.draw do
  
  resources :games do
    member { post :vote }
    collection do
      get '/search' => 'games#index'
    end
    resources :reviews do
      member { post :vote }
    end
  end

  get '/register' => 'users#register'
  post '/register' => 'users#create'
  get '/login' => 'users#login'
  post '/' => 'users#attempt_login'
  get '/logout' => 'users#logout'

  root 'games#index'

end
