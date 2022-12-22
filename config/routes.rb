Rails.application.routes.draw do

# 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
resources :genres, only: [:index, :edit, :create, :update, :show]
resources :items, only: [:index, :create, :new, :show, :edit, :update]
resources :customers, only: [:index, :show, :edit, :update]
resources :orders, only: [:show, :update]
resources :order_details, only: [:update]

get '/' => 'homes#top' , as: "login"

end

get 'customers/my_page' => 'public/customers#show'
get 'customers/information/edit' => 'public/customers#edit'
patch 'customers/information' => 'public/customers#update'
get 'customers/unsubscribe' => 'public/customers#unsubscribe'
patch 'customers/withdraw' => 'public/customers#withdraw'

# 顧客用

root to: 'public/homes#top'
get 'about' => 'public/homes#about'

get 'customers/my_page' => 'public/customers#show'

  devise_for :customers, skip: [:encrypted_passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  
resources :cart_items, only: [:index, :destroy, :update, :create]do
  collection do
delete "/cart_items/destroy_all" => "cart_items#destroy_all"
end
end

resources :items, only: [:index, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

