Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'articles#show'

  namespace :admin do
    resources :articles, only: [:index, :new, :edit, :create, :update, :destroy]
  end
end
