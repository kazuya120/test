Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to: 'homes#top'
  get "home/about" => "homes#about"

  resources :blogs, only:[:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]
end
