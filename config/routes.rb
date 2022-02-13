Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: :sessions},
                       path_names:  {sign_in: :login}

    resources :users

    get "me/" => "users#me"
    patch "me/" => "users#update_me"
    put "me/" => "users#update_me"
  end
  # root "articles#index"
end
