Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users
 
  # resources :shortened_urls, only: [:create,  :show]
  # root to: "shortened_urls#new"
  # get '/:short_url' => 'url_shortener#redirect'
  # post '/shorten' => 'url_shortener#shorten'

  resources :urls, only: [:create, :show]
  get '/:short_url', to: 'urls#redirect'
  resources :url_links
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
