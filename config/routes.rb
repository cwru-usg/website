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
  
  resources :pages, :only => [:show, :update]

  root :to => 'home#index'

end
