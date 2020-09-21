Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :url_mappers, only: %i[create index], path: 'url-mappers'
  get ':id', to: 'url_mappers#show'
end
