Rails.application.routes.draw do
  resources :budgets do
    resources :categories
  end
  
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
