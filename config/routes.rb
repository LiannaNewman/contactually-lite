Rails.application.routes.draw do
  resources :contacts do
    collection { post :import }
  end

  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
end
