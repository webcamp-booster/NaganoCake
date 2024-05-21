Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員用
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about', as: 'about'

    get '/customers/my_page' => 'public/customers#show', as: 'my_page'
    get '/customers/information/edit' => 'public/customers#edit', as: 'edit_customer'
    patch '/customers/information' => 'public/customers#update', as: 'customer'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'

    post '/orders/confirm' => 'public/orders#confirm', as: 'confirm'
    get '/orders/thanks' => 'public/orders#thanks', as: 'thanks'

    scope module: :public do
      resources :items, only: [:index, :show]
      resources :cart_items, only: [:index, :update, :destroy, :create]
      resources :orders, only: [:new, :create, :index, :show]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end

  # 管理者用
  namespace :admin do
    root to: 'homes#top'
    get 'customer_orders' => 'homes#customer_orders', as: 'customer_orders'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, except: [:new, :create, :destroy]

    resources :orders, only: [:show, :update]

    patch '/admin/order_details/:id' => 'order_details#update', as: 'order_detail'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
