Rails.application.routes.draw do
  root 'user_sessions#new'

  resources :courses, only: [:new, :create, :show, :edit, :update, :destroy, :index], shallow: true do
    resources :rosters, only:[:new, :create, :show, :edit, :update, :destroy], shallow: true
  end

  resources :users, only: [:show, :edit, :update, :destroy, :new, :create] do
    member do
      get :activate
      patch :confirm
    end
  end

  resources :rosters do
    member do
      get :export
    end
  end

  resources :evals, shallow: true do
    resources :categories, only: [:new, :create, :edit, :update, :destroy], shallow: true do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :students, only: [:show] do
    resources :grades, only: [:new, :create, :show, :edit, :update ]
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
