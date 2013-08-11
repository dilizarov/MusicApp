MusicApp::Application.routes.draw do
  resources :bands
  resources :albums
  resources :tracks
  resources :notes, :only => [ :create, :destroy ]
  resource :session, :only => [ :create, :destroy ]
  resources :users, :only => [ :create, :destroy, :new ]
end
