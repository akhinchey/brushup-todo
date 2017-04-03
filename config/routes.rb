Rails.application.routes.draw do

  resources :users do
    resources :lists do
      resources :tasks
    end 
  end 

  root "users#new"

end
