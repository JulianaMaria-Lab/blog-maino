Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create]  # Adiciona a rota para criar comentários
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end
