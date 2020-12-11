Rails.application.routes.draw do
  root "articles#index"
  
  get "/fill-articles", to: "articles#fill"


  resources :articles do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
