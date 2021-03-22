Rails.application.routes.draw do
  root 'welcome#home'
  get 'auth/google_oauth2/callback', to: 'sessions#create'

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
  
  post '/students/batch' => 'students#batch_create'  
  resources :students
  resources :students, only: [:show] do
    resources :allergies, only: [:new]
  end
  

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
