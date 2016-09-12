Rails.application.routes.draw do

  root 'photographies#index'

  resources :comments

  resources :photographies do
	  member do
	    put 'like', to: "photographies#like"
	    put 'unlike', to: "photographies#unlike"
	  end
  end

  get '/lenta' => 'photographies#lenta', as: :photography_lenta

  devise_for :users

  resources :relationships, only: [:create, :destroy]


end
