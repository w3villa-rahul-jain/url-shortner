Rails.application.routes.draw do

  get 'urls/new'
  get 'urls/create'
  get 'urls/show'
  get 'shortened_urls/create'
  get 'shortened_urls/show'
  devise_for :users
  get '/s/:slug', to: 'links#show', as: :short

  # resources :shortened_urls, only: [:create,  :show]
  root to: "urls#index"
  # get '/:short_url' => 'url_shortener#redirect'
  # post '/shorten' => 'url_shortener#shorten'
  
  resources :shortened_url
  resources :urls

  post "click_count", to: "urls#click_count"
  # get '/:short_url', to: 'urls#redirect'
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
