Rails.application.routes.draw do
  resources :toys, only: [ :index, :new ]
  root to: 'homes#show', defaults: { name: 'welcome' }
end
