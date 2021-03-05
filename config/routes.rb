Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'
    get 'deacons/index'
    get 'shepherds/index'
    resources :admins
    resources :churchmembers
    resources :deacons
    resources :shepherds
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admins_backoffice/welcome#index'
end
