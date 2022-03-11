Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: :sessions},
                       path_names:  {sign_in: :login}

    resources :users, only: %i[index show]
    get "me/" => "users#me"
    patch "me/" => "users#update"
    put "me/" => "users#update"
    delete "me/" => "users#destroy"

    resources :places do
      get "events", to: "places#events"
      get "reviews", to: "place#"
    end

    resources :events
    resources :reviews
  end
end
