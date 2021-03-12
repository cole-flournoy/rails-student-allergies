Rails.application.routes.draw do
  resources :users
  
  resources :classrooms, only: [:show] do
    resources :students, only: [:index, :new]
  end
  resources :classrooms

  resources :severities
  resources :allergies
  resources :students
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
