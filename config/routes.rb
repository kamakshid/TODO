Rails.application.routes.draw do

  get '/tasks'=> 'tasks#index', as: :index
  get '/tasks/:id'=> 'tasks#show', as: :show
  post '/tasks' => 'tasks#create', as: :create
  put '/tasks/:id' => 'tasks#update', as: :update
  delete '/tasks' => 'tasks#destroy', as: :destroy
  put '/tasks/complete/:id' => 'tasks#toggle_completed', as: :complete

end
