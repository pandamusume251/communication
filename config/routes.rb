Rails.application.routes.draw do
  get 'web/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "web#index"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "verify", :to => "users/registrations#verify"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  get 'category', :to => "categories#index"
end