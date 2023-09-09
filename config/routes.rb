Rails.application.routes.draw do
  get 'courses/index' => 'courses#index'
  get 'courses/new' => 'courses#new'
  get 'courses/:id/edit' => 'courses#edit'
  get 'courses/:id' => 'courses#show'
  post 'courses/:id/update' => 'courses#update'
  post 'courses/:id/destroy' => 'courses#destroy'
  post 'courses/create' => 'courses#create'

  get '/' => 'home#top'
  get 'about' => 'home#about'
end
