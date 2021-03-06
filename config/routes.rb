Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: :sessions},
                       path_names:  {sign_in: :login}

    scope :me do
      get "/", to: "users#me"
      get "places", to: "users#my_places"
      get "participations", to: "users#my_participations"
      patch "/", to: "users#update"
      put "/", to: "users#update"
      delete "/", to: "users#destroy"
    end

    resources :users, only: %i[index show] do
      get "participations", to: "users#participations"
      get "events", to: "users#events"
      get "places", to: "users#places"
    end

    resources :places do
      get "events", to: "places#events"
      get "reviews", to: "places#reviews"
    end

    resources :events do
      get "participations", to: "events#participations"
      get "users", to: "events#users"
      delete "participation", to: "events#delete_participation"
    end

    resources :reviews
    resources :participations
  end
end
