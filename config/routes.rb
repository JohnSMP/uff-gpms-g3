Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  resources :courses, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
      get 'teacher_courses'
    end
  end
  resources :home, only: :index
  resources :orders, only: :index do
    member do
      get 'add_course'
    end
  end
  resources :teachers, only: [:index, :show, :new, :create]
end
