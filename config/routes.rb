Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :projects
    end
  end
end
