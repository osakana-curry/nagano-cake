Rails.application.routes.draw do

    namespace :customer do
      get "/"=>"customers#show"
      get "/quit" => "customers#quit"
      get "/out" => "customers#out", as: 'out'
      get "/edit"=>"customers#edit"
      patch "/" =>"customers#update", as: 'update'

      get 'genres/show'

      get "/confirm" => "orders#confirm"
      get "/complete" => "orders#complete"

      resources :carts,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'carts#all_destroy'
        end
      end

      resources :items, only: [:index, :show]
      resources :addresses, only: [:index,:create,:edit,:update,:destroy]
      resources :orders, only: [:new,:create,:index,:show]
    end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #registrationを除外して、新規登録するページを無くした

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  root to: 'homes#top'
  get 'homes/about' => "homes#about", as: "about"

  namespace :admin do
    resources :genres, only: [:create, :update, :index, :edit, :destroy]
    resources :items
    resources :customers,only: [:show,:update,:index,:edit]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    #patch "/admin/customers" => "customers#update", as: 'update'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
