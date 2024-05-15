Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  # 会員用
  namespace :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]

    get '/customers/my_page' => 'customers#show', as: 'my_page'
    get '/customers/information/edit' => 'customers#edit', as: 'edit_customer'
    patch '/customers/information' => 'customers#update', as: 'customer'
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    get '/orders/thanks' => 'orders#thanks', as: 'thanks'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # 管理者用
  namespace :admin do
    get '/admin' => 'homes#top', as: 'admin'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, except: [:new, :create, :destroy]

    resources :orders, only: [:show, :update]

    patch '/admin/order_details/:id' => 'order_details#update', as: 'order_detail'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
