Rails.application.routes.draw do
  root :to => 'mixtapes#index'
  get 'mixtapes/alphabetize', to: 'mixtapes#alphabetize'
  get 'mixtapes/year_sort', to: 'mixtapes#year_sort'
  get 'mixtapes/subgenres', to: 'mixtapes#subgenres'
  get 'mixtapes/search', to: 'mixtapes#search'

  resources :mixtapes, :only => [:index, :show] do
    patch '/rate', to: 'mixtapes#rate'
    resources :reviews, :except => [:index]
  end

  resources :users do
    resources :mixtapes
  end
end
