Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]

  resources :classrooms
  resources :classrooms, only: [:show] do
    resources :students, only: [:index, :new]
  end

  resources :severities
  resources :allergies
  resources :students
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
