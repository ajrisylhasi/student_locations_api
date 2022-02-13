Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: :sessions},
                       path_names:  {sign_in: :login}
                       
    resources :users, only: [:index, :show]
    get "me/" => "users#me"
    patch "me/" => "users#update"
    put "me/" => "users#update"

    resources :places

  end
end
