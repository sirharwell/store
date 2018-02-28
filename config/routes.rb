Rails.application.routes.draw do
  root 'subs#index'

  resources :subs do
    resources :items
  end
end
