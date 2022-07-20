Rails.application.routes.draw do
  root 'search#index'
  get '/search/', to: 'search#process_query'

  get '*path', to: 'search#error'
end
