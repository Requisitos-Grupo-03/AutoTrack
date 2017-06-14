Rails.application.routes.draw do
  resources :boards
    root 'users#index'
  devise_for :members
  devise_for :installs
  resources :users

  devise_scope :member do
    # root to: "devise/sessions#new"
    get '/log_in', to: 'devise/sessions#new'
    get '/log_out', to: 'devise/sessions#destroy'
  end

  get '/boards', to: 'board#index'
  get '/home', to: 'static_pages#home_page'
  root 'static_pages#home_page'
  get '*unmatched_route', :to => 'static_pages#not_found'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
