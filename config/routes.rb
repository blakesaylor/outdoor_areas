Rails.application.routes.draw do
  get '/areas', to: 'areas#index'
  get '/areas/:id', to: 'areas#show'
end
