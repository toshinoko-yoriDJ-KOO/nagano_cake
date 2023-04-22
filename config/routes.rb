
Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    patch "/admin/order_products/:id" => "order_products#update"
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :types, only:[:index, :create, :edit, :update]
    resources :orders, only:[:show, :update]
  end

  scope module: :customer do
    root to: 'homes#top'
    get "/about" =>"homes#about"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    post '/orders/confirm' => "orders#confirm"
    get '/orders/thanks' => "orders#thanks"
    get "/customers/my_page" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/quit" => "customers#quit"
    patch "/customers/out" => "customers#out"
    resources :delivery_addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :products, only:[:index, :show]
  end

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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
