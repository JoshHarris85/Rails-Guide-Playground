Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles

  get 'welcome/index'
end
