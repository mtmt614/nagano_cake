Rails.application.routes.draw do

# 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
resources :genres, only: [:index, :edit, :create, :update, :show]
resources :items, only: [:index, :create, :new, :show, :edit, :update]
resources :customers, only: [:index, :show, :edit, :update]

get '/' => 'homes#top' , as: "login"

end

resources :cart_items, only: [:index, :destroy, :update, :create] do
      collection do
        delete '/destroy_all' => 'cart_items#destroy_all'
      end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

