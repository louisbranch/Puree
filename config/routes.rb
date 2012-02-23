Puree::Application.routes.draw do

  resources :tasks, :only => [:index, :create] do
    post 'sort', :on => :collection
  end

  resources :todos, :only => [:create]

  root :to => 'tasks#index'

end
