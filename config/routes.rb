Rails.application.routes.draw do
  # get 'comments/new'

  # get 'comments/create'

  # get 'comments/index'

  root 'comments#welcom'

  devise_for :users

end
