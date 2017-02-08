Rails.application.routes.draw do
  root :to => 'mixtapes#index'

  resources :mixtapes, :only => [:index, :show] do
    patch '/rate', to: 'mixtapes#rate'
    resources :reviews, :except => [:index]
  end

  resources :users do
    resources :mixtapes
  end
end
