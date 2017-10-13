Rails.application.routes.draw do
  root to: 'homes#show', defaults: { name: 'welcome' }
end
