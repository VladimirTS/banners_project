Rails.application.routes.draw do
  root to: "static_pages#home"

  resources :flash_banners, except: [:index]
  resources :html_banners,  except: [:index]

  resources :image_banners, except: [:index] do
    get "increase", action: :inc_click_count_and_redir_url, on: :member
  end

  get "admin" => "admin#index"

  property_type  = /residential|commercial|land|garage/
  deal_kind      = /sale|rent/
  deal_direction = /offer|demand/

  controller :test_one, property_type: property_type, deal_kind: deal_kind, deal_direction: deal_direction do
    get "test_one/first(/:property_type)(/:deal_kind)(/:deal_direction)"  => "one#first_method"
    get "test_one/second(/:property_type)(/:deal_kind)(/:deal_direction)" => "one#second_method"
    get "test_one/third(/:property_type)(/:deal_kind)(/:deal_direction)"  => "one#third_method"
    get "test_one/fours(/:property_type)(/:deal_kind)(/:deal_direction)"  => "one#fours_method"
  end

  controller :test_two, property_type: property_type, deal_kind: deal_kind, deal_direction: deal_direction  do
    get "test_two/first(/:property_type)(/:deal_kind)(/:deal_direction)"  => "two#first_method"
    get "test_two/second(/:property_type)(/:deal_kind)(/:deal_direction)" => "two#second_method"
    get "test_two/third(/:property_type)(/:deal_kind)(/:deal_direction)"  => "two#thirthird_methodd"
    get "test_two/fours(/:property_type)(/:deal_kind)(/:deal_direction)"  => "two#fours_method"
  end

  controller :test_three, property_type: property_type, deal_kind: deal_kind, deal_direction: deal_direction  do
    get "test_three/first(/:property_type)(/:deal_kind)(/:deal_direction)"  => "three#first_method"
    get "test_three/second(/:property_type)(/:deal_kind)(/:deal_direction)" => "three#second_method"
    get "test_three/third(/:property_type)(/:deal_kind)(/:deal_direction)"  => "three#third_method"
    get "test_three/fours(/:property_type)(/:deal_kind)(/:deal_direction)"  => "three#fours_method"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
