Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'public/homes/about'
  
# 顧客用
# URL /user/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 退会確認画面
  get "/users/:id/unsubscribe" => "public/users#unsubscribe", as: "unsubscribe"
  # 論理削除用のルーティング
  patch "/users/:id/withdrawal" => "public/users#withdrawal", as: "withdrawal"

  #resource :favorites, only: [:create, :destroy]   
  #resources :post_comments, only: [:create, :destroy]


  scope module: :public do
   # resources :posts, only: [:index, :new, :create, :show, :update] 
    resources :users, only: [:index, :edit, :show, :update]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
  end
  
    #管理者側
  namespace :admin do
    root to: 'users#index'
    resources :posts, only: [:index, :show, :destroy] do
      #resources :post_comments, only: [:index, :destroy]
    end
    resources :post_comments, only: [:index, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
 
end
