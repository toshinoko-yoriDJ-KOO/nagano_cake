Rails.application.routes.draw do
  namespace :admin do
    get 'order_products/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'types/index'
    get 'types/create'
    get 'types/edit'
    get 'types/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
  end
  namespace :customer do
    get 'delivery_addresses/index'
    get 'delivery_addresses/edit'
    get 'delivery_addresses/create'
    get 'delivery_addresses/update'
    get 'delivery_addresses/destroy'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customer do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  get 'homes/top'
  get 'homes/about'
  root to: 'homes#top'
  get "/about" =>"homes#about"
  scope module: :customer do
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  end
  get "/customers/my_page" => "customers#show"
  get "/customers/information/edit" => "customers#edit"
  patch "/customers/information" => "customers#update"
  get "/customers/quit" => "customers#quit"
  patch "/customers/out" => "customers#out"
  get "/cart_items" => "cart_items#index"
  patch "/cart_items/:id" => "cart_items#update"
  delete "/cart_items/:id" => "cart_items#destroy"
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  post "/cart_items" => "cart_items#create"
  get "/orders/new" => "orders#new"
  post "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  get "/admin" => "homes#top"
  get "/admin/orders/:id" => "orders#show"
  patch "/admin/orders/:id" => "orders#update"
  patch "/admin/order_products/:id" => "order_products#update"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  resources :delivery_addresses, only:[:index, :edit, :create, :update, :destroy]
  namespace :admin do
  resources :products, only:[:index, :new, :create, :show, :edit, :update]
  resources :customers, only:[:index, :show, :edit, :update]
  resources :types, only:[:index, :create, :edit, :update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
