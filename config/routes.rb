Rails.application.routes.draw do
  resources :toys, only: %i[ index show new create ]
  root to: 'homes#show', defaults: { name: 'welcome' }
end
