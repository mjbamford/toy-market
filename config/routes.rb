Rails.application.routes.draw do
  resource  :session, only: %i[ new create destroy ]
  resources :toys, only: %i[ index show new create ]
  resources :messages, only: %i[ index show new create destroy ]
  root to: 'homes#show', defaults: { name: 'welcome' }
end
