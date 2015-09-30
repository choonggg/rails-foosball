Rails.application.routes.draw do

  root to: "matches#index"
  resources :users

  resources :matches do
    resources :teams, only: [:edit, :update] do
      member do
        get 'add_member'
      end
      resources :memberships, only: :destroy
    end

    resources :games, only: [ :show, :create ] do
      member do
        get 'add_home'
        get 'add_away'
      end
    end
  end

end
