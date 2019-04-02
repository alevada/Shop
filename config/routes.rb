

#DeviseRolesUserManagement::Application.routes.draw do
#devise_for :users
  #devise_scope :user do
    #get '/login' => 'devise/sessions#new'
    #get '/logout' => 'devise/sessions#destroy'
    #end
  #resources :users, :controller => "users"
  # root :to => "dashboard#index"
#end

Rails.application.routes.draw do
  get 'products/index'
  #get 'sessions/new'
  #post 'sessions/new'
  #post 'sessions/create'
  #post 'sessions/create'
  #post '/signin', to: 'sessions#create', as: 'signin'
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

 ############## resources :sessions, only: [:new, :create, :destroy]

  resources :users
  resources :posts
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  root 'admin#index'

  get 'store_index' => 'store#index'

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

