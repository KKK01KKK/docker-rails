Rails.application.routes.draw do
  post 'likes/:course_id/create' => 'likes#create'
  post 'likes/:course_id/destroy' => 'likes#destroy'

  get 'signup' => 'users#new'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id' => 'users#mypage'
  post 'users/create' => 'users#create'
  post 'users/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  
  get 'coaches/index' => 'coaches#index'
  get 'coaches/:id/mypage' => 'coaches#mypage'
  get 'coaches/signup' => 'coaches#new'
  get 'coaches/login' => 'coaches#login_form'
  get 'coaches/:id/edit' => 'coaches#edit'
  get 'coaches/:id' => 'coaches#show'
  post 'coaches/logout' => 'coaches#logout'
  post 'coaches/create' => 'coaches#create'
  post 'coaches/:id/update' => 'coaches#update'
  post 'coaches/login' => 'coaches#login'

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
