Rails.application.routes.draw do
  resources :users, :only => [:new, :show, :create] do
    resources :questions
    resources :answers, :only => []
  end

  resources :question, :only => [:show] do
    resources :answers
  end

  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
