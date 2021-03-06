Rails.application.routes.draw do

  get '/', to: 'shelters#index'

  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id', to: 'shelters#show'
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

  #favorites
  get '/favorites', to: 'favorites#index'
  patch '/favorites/:pet_id', to: 'favorites#update'
  delete '/favorites/:pet_id', to: 'favorites#destroy'
  delete '/favorites/:pet_id/from_index', to: 'favorites#destroy_from_index'
  delete '/favorites', to: 'favorites#destroy_all'

  #reviews
  get '/shelters/:id/reviews/new', to: 'reviews#new'
  get 'shelters/:id/:review_id/edit', to: 'reviews#edit'
  get '/shelters/:id/:review_id/delete', to: 'reviews#destroy'
  post '/shelters/:id/reviews', to: 'reviews#create'
  patch '/shelters/:id/:review_id/update', to: 'reviews#update'

  #adoptions
  get '/adoptions/new', to: 'adoptions#new'
  get '/adoptions/:id', to: 'adoptions#show'
  post '/favorites', to: 'adoptions#create'
  get '/pets/:pet_id/adoptions', to: 'adoptions#index'
  patch '/pets/:pet_id/adoptions/:adoption_id', to: 'adoptions#approvals'
  patch '/adoptions/:id/:pet_id', to: 'adoptions#revoke'
end
