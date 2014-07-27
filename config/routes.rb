Rails.application.routes.draw do
  root to: "static_pages#home"

  resources :flash_banners, :html_banners, :image_banners

  get "admin" => "admin#index"

  controller :test_one do
    get "test_one(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_one#all_record"
    get "test_one(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_one#test_two"
    get "test_one(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_one#test_three"
    get "test_one(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_one#test_four"
  end

  controller :test_two do
    get "test_two(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_two#all_record"
    get "test_two(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_two#test_two"
    get "test_two(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_two#test_three"
    get "test_two(/:property_type)(/:deal_kind)(/:deal_direction)"  => "test_two#test_four"
  end

  controller :test_three do
    get "test_three(/:property_type)(/:deal_kind)(/:deal_direction)" => "test_three#all_record"
    get "test_three(/:property_type)(/:deal_kind)(/:deal_direction)" => "test_three#test_two"
    get "test_three(/:property_type)(/:deal_kind)(/:deal_direction)" => "test_three#test_three"
    get "test_three(/:property_type)(/:deal_kind)(/:deal_direction)" => "test_three#test_four"
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
