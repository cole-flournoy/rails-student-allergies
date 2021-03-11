Rails.application.routes.draw do
  resources :severities
  resources :allergies
  resources :students
  resources :classrooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
