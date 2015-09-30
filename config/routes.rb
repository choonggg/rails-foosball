Rails.application.routes.draw do

  root to: "matches#index"
  resources :users

  resources :matches do
    resources :teams do
      member do
        get 'add_member'
      end
      resources :memberships, only: :destroy
    end
    
    resources :games
  end

end
