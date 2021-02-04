Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get('/posts/home', {to: 'posts#home'})
  resources :posts do
    resources :comments
  end
  resources :users, only:[:new, :create,:edit, :update]
  get('/users/:id/edit_password', {to: 'users#edit_password', as: :edit_password})
  patch('/users/:id/update_password', {to: 'users#update_password', as: :update_password})
  resource :session,only:[:new, :create, :destroy]


end
