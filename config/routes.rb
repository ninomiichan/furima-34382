Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  root 'items#index'
=======
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  root 'items#index'
  

  resources :users, only: [:index, :edit]

  resources :items, only: [:new, :show, :create, :edit, :update, :destroy] do 
    resources :comments, only: [:create, :destroy]
    post :edit
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
      get 'require_login', to: 'items#require_login'
    end
    
    resources :buyers, only: :index do
      collection do
        get 'index', to: 'buyers#index'
        post 'pay', to: 'buyers#pay'
        get 'done', to: 'buyers#done'
      end
    end
  end

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
      get 'require_make_card', to: 'cards#require_make_card'
    end
  end


>>>>>>> Stashed changes

end
