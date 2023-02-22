Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
      resources :customers do
          patch 'retire' => 'customers#retire', as: 'retire'
      end
      resources :comments, only:[:index, :destroy]
      resources :genres, only: [:index, :edit, :update, :destroy, :create]
      resources :cities
      root to: "customers#index"
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :customer do

    root to: "homes#top"
    resources :customers, only: [:show, :edit, :update] do
      # member do
      #   get :favorites
      # end
       resources :favorites, only: [:index]
    end
    resources :recruits, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :recruit_comments, only: [:create]
    end
    get "search" => "searches#search"
    get 'message/:id' => 'messages#show', as: 'message'
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
  end
  

end
