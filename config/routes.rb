Rails.application.routes.draw do
  get 'login' => 'coaches#login_form'
  post 'login' => 'coaches#login'
  post 'logout' => 'coaches#logout'

  get 'signup' => 'coaches#new'
  get 'coaches/index' => 'coaches#index'
  get 'coaches/:id/edit' => 'coaches#edit'
  get 'coaches/:id' => 'coaches#show'
  post 'coaches/create' => 'coaches#create'
  post 'coaches/:id/update' => 'coaches#update'

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
