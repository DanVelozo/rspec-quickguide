Rails.application.routes.draw do
  get 'links/new'

  get 'links/show'

  resources :links
  get ':shortlink', to: 'links#expand', as: :expand_link
end
