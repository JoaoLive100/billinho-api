Rails.application.routes.draw do
  resources :institutions
  resources :students
  resources :enrollments
  resources :invoices
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
