Rails.application.routes.draw do

  
  

  resources :shortners
  devise_for :users
  get '/s/:slug', to: 'links#show', as: :short

  root to: "shortners#index"
  
  resources :urls

  post "click_count", to: "shortners#click_count"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# Shorten a URL
# $ curl -X POST -H "Content-Type: application/json" -d '{"original_url": "https://www.google.com"}' http://localhost:3000/urls
# {"short_url":"_6s-Pw"}

# Get the number of clicks for a short URL
# $ curl http://localhost:3000/_6s-Pw
# {"clicks":1}

# Redirect to the original URL
# $ curl -L http://localhost:3000/_6s-Pw
