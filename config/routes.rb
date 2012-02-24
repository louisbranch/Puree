Puree::Application.routes.draw do

  resources :tasks, :only => [:index, :show, :create] do
    post 'sort', :on => :collection
    resources :pomodoros, :only => [:create]
  end

  resources :todos, :only => [:create]

  root :to => 'tasks#index'

end
