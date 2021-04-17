Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :want
      # 要確認
      patch "updates", to: "wants_update#update"
    end
  end
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions",
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
