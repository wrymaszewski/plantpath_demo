Rails.application.routes.draw do
  root to: 'fronts#index'
  resources :competent_cells, except: :show
  resources :vectors do
    resources :vector_attachments, except: [:index, :show]
  end
  resources :manuals, except: [:show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :responsibilities
  resources :fronts, only: [:index] do
    collection do
      post 'primers'
      post 'competent_cells'
      post 'bacterial_stocks'
      post 'sequences'
      post 'sequence_attachments'
      post 'regular_chemicals'
      post 'mol_biol_chemicals'
      post 'vectors'
      post 'vector_attachments'
      post 'responsibilities'
      post 'manuals'
      post 'users'
    end
  end
  
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
  
  resources :sequences do
    get 'checked', :on => :member 
    resources :bacterial_stocks, except: [:index, :show]
    resources :primers, except: [:index, :show]
    resources :sequence_attachments, except: [:index, :show]
  end

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  get 'primers' => 'primers#index', as: :primers
  get 'bacterial_stocks' => 'bacterial_stocks#index', as: :bacterial_stocks
end
