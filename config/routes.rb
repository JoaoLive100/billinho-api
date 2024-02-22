Rails.application.routes.draw do

  # GET /institutions/all (all institutions)
  get 'institutions/all', to: 'institutions#all'

  # GET /institutions/disabled (all disabled institutions)
  get 'institutions/disabled', to: 'institutions#disabled'

  resources :institutions
  resources :students
  resources :enrollments
  resources :invoices
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
