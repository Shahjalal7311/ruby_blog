Rails.application.routes.draw do
  root to: 'web/welcome#index'
  
  resources :passwords, controller: "clearance/passwords", only: [:create]
  resource :session, controller: "clearance/sessions", only: [:create]

  get "admin/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "admin/sign_up" => "clearance/users#new", as: "sign_up"

  constraints Clearance::Constraints::SignedIn.new { |user| } do
    root to: "admin/dashboards#index", as: :admin_root
    namespace :admin do
      resources :dashboard
      resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
        post :publish
        post :unpublish
      end
      resources :catagories
      resources :users do 
        get :change_password
        post :update_passord
      end  
      # resources :users, controller: "clearance/users" do
      #   resource :password,
      #     controller: "clearance/passwords",
      #     only: [:edit, :update]
      # end
    end
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "admin/dashboards#index", as: :signed_in_root
    namespace :admin do
      resources :dashboard
      resources :articles do
        post :publish
        post :unpublish
      end
      resources :catagories do
        post :publish
        post :unpublish
      end
      resources :users do 
        get :change_password
        post :update_password
      end
      resources :user_menus do
        post :publish
        post :unpublish
        get  :link
        get  :addlink
        post :createlink
        get :addlinkedit
        patch :updateLinkedit
        post :update_linkadd
        post :destroyAction
      end
      resources :user_roles do 
        get :permission
        post :permissionUpdate
        post :publish
        post :unpublish
      end
      # resources :users, controller: "clearance/users", only: [:show] do
      #   resource :password,
      #     controller: "clearance/passwords",
      #     only: [:edit, :update]
      # end
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "web/welcome#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
