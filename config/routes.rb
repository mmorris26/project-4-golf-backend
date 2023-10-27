Rails.application.routes.draw do
  get 'current_user/index'


  root 'current_user#index'

  get '/current_user', to: 'current_user#index'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'courses/current_course', to: "courses#current_course"
  get 'rounds/current_round', to: "rounds#current_round"
  get 'courses/rounds', to: "courses#course_rounds"

  resources :courses
  resources :rounds
end
