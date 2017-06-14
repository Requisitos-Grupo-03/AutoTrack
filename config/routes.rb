Rails.application.routes.draw do
  devise_for :members
  devise_for :installs

  resources :users
  get '/home', to: 'static_pages#home_page'
  # devise_scope :member do
  #   root to: "devise/sessions#new"
  # end
    root 'static_pages#home_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
