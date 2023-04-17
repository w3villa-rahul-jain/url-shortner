Rails.application.routes.draw do

  get 'shortened_urls/create'
  get 'shortened_urls/show'
  devise_for :users
  get '/s/:slug', to: 'links#show', as: :short

  resources :shortened_urls, only: [:create,  :show]
  root to: "shortened_urls#new"
  get '/:short_url' => 'url_shortener#redirect'
  post '/shorten' => 'url_shortener#shorten'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
