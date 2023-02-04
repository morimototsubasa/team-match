Rails.application.routes.draw do
  namespace :admin do
    get 'genre/index'
    get 'genre/edit'
  end
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
      resources :customers
      resources :genres
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :customer do
    root to: "homes#top"
    resources :customers
    resources :recruits
  end

end
