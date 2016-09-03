Rails.application.routes.draw do
  # get 'photographies/new'

  # get 'photographies/create'

  # get 'comments/new'

  # get 'comments/create'

  # get 'comments/index'

  root 'comments#welcom'

  resources :comments, :photographies

  devise_for :users

end
