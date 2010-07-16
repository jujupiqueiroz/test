ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resources :user_sessions

  map.resources :users

  map.resources :projects
  
  map.resources :projects, :has_many => :tasks
 
  map.root :controller => "projects"
  

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
