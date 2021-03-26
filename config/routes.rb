Rails.application.routes.draw do
  # Search
  get '/students/search' => 'students#search'
  
  # Login/Logout/Signup
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]

  # Classrooms
  resources :classrooms
  resources :classrooms, only: [:show] do
    resources :students, only: [:index, :new]
    get '/add_students' => 'classrooms#students_to_associate'
    post '/add_students' => 'classrooms#associate_students'
    get '/students/with_allergy' => 'students#with_allergy'
    post '/remove_student' => 'classrooms#remove_association'
  end
  
  # Students
  post '/students/batch' => 'students#batch_create'  
  get '/students/with_allergy' => 'students#with_allergy'
  resources :students
  resources :students, only: [:show] do
    resources :allergies, only: [:new]
  end
  
  # Allergies
  resources :allergies, only: [:new, :destroy]
  post '/allergies' => 'allergies#create'
  
  # Severities
  resources :severities, only: [:destroy]


  

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
