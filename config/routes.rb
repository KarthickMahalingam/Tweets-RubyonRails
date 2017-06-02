Rails.application.routes.draw do

  get 'comments/show'

  #root 'main/index' => 'main#index'
  get 'main/index' => 'main#index' , :as => :main_page
  get '/main/create' => 'main#create', :as => :create_login, via: 'post'
  #match '/load',      to: 'load#create',        via: 'post'
  resources :post
  get 'comments/:id' => 'comments#show'
  resources :comments
  root 'main#show'
  devise_for :users

  authenticated :users do
    root to: 'main#index', as: :authenticated_root
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
