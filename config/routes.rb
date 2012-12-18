Msociais::Application.routes.draw do

  # http://guides.rubyonrails.org/routing.html

  resources :multas do
    get 'flag'
    post 'create_flag'
    match 'like'
    get 'all' => 'multas#index_all', :on => :collection
  end
  
  resources :admin, :as => "admin", :only => [:index] do
    collection do
      get 'invisiveis'
      get 'lista'
      get 'blacklist'
      get 'debug_pictures'
      get 'show_multa/:multa_id' => "admin#show_multa"
      match 'bloquear_ip/:id' => "admin#bloquear_ip", :via => [:delete]
      match 'remover_blacklist/:id' => "admin#remover_blacklist", :via => [:put]
    end
  end
  
  match 'sobre' => 'multas#sobre'
  match 'mais_multados' => 'multas#mais_multados'
  get 'aniversario2012' => 'multas#aniversario2012'
  
  # Root
  root :to => 'multas#index'

  # API
  resources :api_keys
  resources :api, :only => [:index, :create, :new] do
    get 'aplicativos', :on => :collection
  end
  
end
