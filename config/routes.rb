Rails.application.routes.draw do
      get "/areas/search" => "areas#search"
      post "/areas/search" => "areas#search"
      post "/areas" => "areas#create"
      root "areas#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
