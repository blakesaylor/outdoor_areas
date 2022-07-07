Rails.application.routes.draw do
  get '/areas', to: 'areas#index'
  get '/areas/:id', to: 'areas#show'
  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
  get '/areas/:id/climbs', to: 'areas#show_area_climbs'
end
