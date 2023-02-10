Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
      resources :customers
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
    resources :customers, only: [:show, :edit, :update]
    resources :recruits, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end

end
