Rails.application.routes.draw do
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new'
  post '/areas', to: 'areas#create'
  get '/areas/:id', to: 'areas#show'
  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  delete '/areas/:id', to: 'areas#destroy'
  get '/areas/:area_id/climbs', to: 'area_climbs#index'
  get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  post 'areas/:area_id/climbs/', to: 'area_climbs#create'
  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
  get '/climbs/:id/edit', to: 'climbs#edit'
  patch '/climbs/:id', to: 'climbs#update'
  get '/area/:id/climbs?sort=alpha', to: 'area_climbs#index'
  delete 'climbs/:id', to: 'climbs#destroy'
end
