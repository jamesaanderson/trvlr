Trvlr::Application.routes.draw do
  root to: 'destinations#new'

  resources :destinations, only: [:new, :create, :show]
end
