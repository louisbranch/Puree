Puree::Application.routes.draw do

  resources :tasks, :only => [:index, :show, :create] do
    post 'sort', :on => :collection
  end

  resources :pomodoros, :only => [:create, :update]

  resources :todos, :only => [:create]

  root :to => 'tasks#index'

end
