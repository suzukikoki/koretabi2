Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'homes/about'
  
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


  #resource :favorites, only: [:create, :destroy]   
  #resources :post_comments, only: [:create, :destroy]


  scope module: :public do
   # resources :posts, only: [:index, :new, :create, :show, :update] 
   
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    
  end
 
end
