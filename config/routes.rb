Rails.application.routes.draw do
  resources :budgets
  resources :categories
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
