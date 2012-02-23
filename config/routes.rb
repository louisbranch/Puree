Puree::Application.routes.draw do

  resources :tasks, :only => [:index, :create] do
    post 'sort', :on => :collection
  end

  root :to => 'tasks#index'

end
