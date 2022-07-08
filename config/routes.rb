Rails.application.routes.draw do
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new'
  post '/areas', to: 'areas#create'
  get '/areas/:id', to: 'areas#show'
  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  get '/areas/:id/climbs', to: 'areas#climbs_index'
  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
end
