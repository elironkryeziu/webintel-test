Rails.application.routes.draw do
  devise_for :users
  root "articles#index"  
  get "/fill-articles", to: "articles#fill"
  get "/search", to: "search#index", :as => 'search_page'

  resources :articles do
    resources :comments
    resources :likes
  end
end
