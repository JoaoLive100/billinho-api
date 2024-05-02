Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # ----------------- INSTITUTIONS -----------------
  # GET /institutions/all (all institutions)
  get 'institutions/all', to: 'institutions#all'

  # GET /institutions/disabled (all disabled institutions)
  get 'institutions/disabled', to: 'institutions#disabled'

  resources :institutions

  # ----------------- STUDENTS -----------------
  # GET /students/all (all students)
  get 'students/all', to: 'students#all'

  # GET /students/disabled (all disabled students)
  get 'students/disabled', to: 'students#disabled'

  resources :students

  # ----------------- ENROLLMENTS -----------------
  # GET /enrollments/student_enrollments/:student_id (enrollments by student id)
  get 'enrollments/student_enrollments/:student_id', to: 'enrollments#student_enrollments'

  # GET /enrollments/institution_enrollments/:institution_id (enrollments by institution id)
  get 'enrollments/institution_enrollments/:institution_id', to: 'enrollments#institution_enrollments'
  
  # GET /enrollments/all (all enrollments)
  get 'enrollments/all', to: 'enrollments#all'

  # GET /enrollments/disabled (all disabled enrollments)
  get 'enrollments/disabled', to: 'enrollments#disabled'
  
  resources :enrollments

  # ----------------- INVOICES -----------------
  # GET /invoices/student_invoices/:student_id (invoices by student id)
  get 'invoices/student_invoices/:enrollment_id', to: 'invoices#enrollment_invoices'

  # GET /invoices/institution_invoices/:institution_id (invoices by institution id)
  get 'invoices/institution_invoices/:institution_id', to: 'invoices#institution_invoices'

  # GET /invoices/enrollment_invoices/:enrollment_id (invoices by enrollment id)
  get 'invoices/enrollment_invoices/:enrollment_id', to: 'invoices#enrollment_invoices'

  # GET /invoices/all (all invoices)
  get 'invoices/all', to: 'invoices#all'

  # GET /invoices/disabled (all disabled invoices)
  get 'invoices/disabled', to: 'invoices#disabled'

  resources :invoices
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
