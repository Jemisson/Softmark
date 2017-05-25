Rails.application.routes.draw do
  root 'user/members#index'

  get 'admin', to: 'backoffice/dashboard#index'

  namespace :user do
    resources :members, only: [:index]
    resources :advertisings, only: [:show]
  end

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    resources :members, except: [:show]
    resources :clients, except: [:show, :destroy]
    resources :weathers, except: [:show, :destroy]
    resources :advertisings, except: [:show]
    resources :qrcodes , except: [:show]
    get 'generate_qr/:id', to: 'qrcodes#generate', as: 'generate'
    get 'download/:id', to:'qrcodes#download', as:'qr_code'
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, :skip => [:registration]
  devise_for :members, :skip => [:registration]
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
