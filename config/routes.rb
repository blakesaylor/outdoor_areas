Rails.application.routes.draw do
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new'
  post '/areas', to: 'areas#create'
  get '/areas/:id', to: 'areas#show'
  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  get '/areas/:area_id/climbs', to: 'area_climbs#index'
  get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
end
