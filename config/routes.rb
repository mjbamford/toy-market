Rails.application.routes.draw do
  resources :toys, only: [ :index ]
  root to: 'homes#show', defaults: { name: 'welcome' }
end
