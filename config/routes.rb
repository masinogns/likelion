Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users do
  # get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
 end

  get '/posts/new' => 'posts#new'
  post '/posts/create' => 'posts#create'

  root "posts#index"
  get '/posts/index' => 'posts#index'
  get '/posts/show/:post_id' => 'posts#show'

  get 'posts/destroy/:post_id' => 'posts#destroy'

  get '/posts/edit/:post_id' => 'posts#edit'
  post '/posts/update/:post_id' => 'posts#update'

  post '/posts/show/:post_id/comments/create' => 'comments#create'
  post '/posts/show/:post_id/comments/:comment_id/create' => 'comments#createTwo'
  post '/posts/show/:post_id/comments/destroy/:comment_id' => 'comments#destroy'

  get '/posts/show/:post_id/comments/:comment_id/count' => 'comments#count'

  post '/searches/search' => 'searches#search'
end
