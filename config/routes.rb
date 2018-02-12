Rails.application.routes.draw do
  resources :tmcs
  resources :ufs
  resources :dolars
  root 'welcome#index'

  get 'welcome/search', to: 'welcome#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
