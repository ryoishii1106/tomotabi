Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
  end
end
