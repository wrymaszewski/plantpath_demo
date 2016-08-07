Rails.application.routes.draw do
  resources :competent_cells, except: :show
  resources :vectors do
    resources :vector_attachments, except: [:index, :show] do
        get 'download_file', :on => :member
        get 'view_file', :on => :member
      end
  end
  resources :manuals, except: [:edit, :show, :update] do
    get 'download_file', :on => :member
    get 'view_file', :on => :member
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :responsibilities
  resources :fronts, only: [:index]
  resources :regular_chemicals
  resources :mol_front, only: [:index] do
    collection do
      post 'filter_regular'
      post 'filter_molecular'
    end
  end
  resources :mol_biol_chemicals
  resources :bacterial_fronts, only: [:index] do
    collection do
      post 'filter_species'
    end
  end

  
  get 'primers' => 'primers#index', as: :primers
  get 'bacterial_stocks' => 'bacterial_stocks#index', as: :bacterial_stocks


  resources :sequences do
    get 'checked', :on => :member 
    resources :bacterial_stocks, except: [:index, :show]
    resources :primers, except: [:index, :show]
    resources :sequence_attachments, except: [:index, :show] do
      get 'download_file', :on => :member
      get 'view_file', :on => :member
    end
  end

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  root to: 'fronts#index'
end
