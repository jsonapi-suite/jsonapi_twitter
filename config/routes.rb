Rails.application.routes.draw do
  scope path: '/api' do
    resources :users, only: [:index, :show]
    resources :tweets
    resources :messages, only: [:index, :show]

    resources :docs, only: [:index], path: '/swagger'
  end
end
