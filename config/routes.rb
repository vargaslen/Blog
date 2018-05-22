Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments , only: [:create , :update , :destroy]
  end
=begin
    get "/articles"  index
    post "/articles"  create
    delete "/articles/:id"  destroy
    get "/articles/:id"  show
    get "/articles/new"  new
    get "/articles/:id/edit"  edit
    put "/articles/:id"  update
    patch "/articles/:id"  update
=end

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
