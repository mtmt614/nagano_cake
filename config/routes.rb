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

# 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
resources :cart_items, only: [:index, :destroy, :update, :create]
delete "/cart_items/destroy_all" => "cart_items#destroy_all"
resources :items, only: [:index, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

