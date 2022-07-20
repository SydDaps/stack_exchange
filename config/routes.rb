Rails.application.routes.draw do
  root 'search#index'
  get '/search/{:query}', to: 'search#process_query'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
