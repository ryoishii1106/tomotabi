Rails.application.routes.draw do
  root to: 'top#index'
  ActiveAdmin.routes(self)

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[index show create]
    end
  end
end
