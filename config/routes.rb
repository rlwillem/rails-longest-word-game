Rails.application.routes.draw do
  post 'reset', to: 'games#reset'
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
