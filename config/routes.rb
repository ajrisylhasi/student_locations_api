Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: :sessions},
                       path_names:  {sign_in: :login}

    get "me/" => "users#me"
    patch "me/" => "users#update"
    put "me/" => "users#update"
    delete "me/" => "users#destroy"

    get "me/places" => "users#my_places"

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
    end

    resources :reviews
    resources :participations
  end
end
