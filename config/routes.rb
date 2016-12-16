Rails.application.routes.draw do

  get 'conversations/index'

  get 'conversations/show'

  get 'conversations/create'

  get 'user_categories/create'

  get 'user_categories/destroy'

  get 'events/index'
  #get 'likes/create'
  get 'comments/index'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :categories
  root 'pictures#index'
 # resource :categories do
 #   member do
 #     get :pictures
 #   end
 # end
  #scope "/:locale" do
      #resources :pictures

  resources :categories do
    get '/:id', to: 'pictures#show', as: "picture"
    match 'delete_relation', to: 'categories#delete_relation', on: :member, via: :delete
    match 'create_relation', to: 'categories#create_relation', on: :member, via: :post
    #get 'create_relation', to: 'category#create_relation', on: :member
    #get 'delete_relation', to: 'category#delete_relation', on: :member
    # member do
    #   get :delete_relation, :create_relation
    # end
  end

  resources :pictures, only: [:index, :show, :create] do
    resources :comments, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
  end

  resources :messages, only: [:index, :create]

  resources :conversations, only: [:index, :create, :show, :show_partial] do
    match 'show_partial', to: 'conversations#show_partial', on: :member, via: :get
  end

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  mount ActionCable.server => '/cable'
end
