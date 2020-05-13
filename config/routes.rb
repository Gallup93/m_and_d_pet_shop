Rails.application.routes.draw do

  get '/', to: 'shelters#index'

  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  #pets
  get '/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/pets/:pet_id', to: 'pets#show'
  get '/pets/:pet_id/edit', to: 'pets#edit'
  patch '/pets/:pet_id', to: 'pets#update'
  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  delete '/pets/:pet_id', to: 'pets#destroy'

  #reviews
  get '/shelters/:id/reviews/new', to: 'reviews#new'
  get '/shelters/:id/reviews', to: 'reviews#new'
  post '/shelters/:id/reviews', to: 'reviews#create'
end
