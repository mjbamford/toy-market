Rails.application.routes.draw do
  resources :toys
  root to: 'homes#show', defaults: { name: 'welcome' }
end
