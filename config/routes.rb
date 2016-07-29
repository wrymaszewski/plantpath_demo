Rails.application.routes.draw do
    resources :manuals do
    get 'download_file', :on => :member
    get 'view_file', :on => :member
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :responsibilities
  resources :fronts, only: [:index]
  resources :regular_chemicals
  resources :mol_biol_chemicals

  
  get 'primers' => 'primers#index', as: :primers
  get 'bacterial_stocks' => 'bacterial_stocks#index', as: :bacterial_stocks


  resources :sequences do
    get 'checked', :on => :member 
    resources :bacterial_stocks, except: [:index, :show]
    resources :primers, except: [:index, :show]
    resources :sequence_attachments, except: [:show, :index] do
      get 'download_file', :on => :member
      get 'view_file', :on => :member
    end
  end

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  root to: 'fronts#index'
end
