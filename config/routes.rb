Usg::Application.routes.draw do

  devise_for :users
  
  mount Mercury::Engine => '/'
  namespace :mercury do
    resources :images
  end
  
  get "admin", :controller=>"admin/admin", :action=>"index"
  namespace :admin do 
    resources :pages do
      collection do
        get 'active'
        get 'archived'
      end
    end
    resources :users
  end
  
  match ':id', :as => :page, :via => :get, :controller => :pages, :action => :show
  match ':id', :via => :put, :controller => :pages, :action => :update

  root :to => 'home#index'

end
