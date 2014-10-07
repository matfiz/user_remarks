UserRemarks::Engine.routes.draw do
  resources :remarks

  root to: "remarks#index"

end
