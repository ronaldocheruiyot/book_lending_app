Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [ :index, :show ] do
    member do
      post :borrow
      post :return
    end
  end
  resources :borrowings, only: [ :index ]

  # New route for user profile
  get "profile", to: "users#profile", as: :user_profile

  root "books#index"
end
