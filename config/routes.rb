Rails.application.routes.draw do
  root to: 'web/welcome#index'
  get '/admin' => 'web/admin/welcome#index'
  scope module: :web do
    resource :session, only: [:new, :create, :destroy]
    resources :organizers, only: [ :new, :create, :destroy ]
    namespace :admin do
      resources :organizers, except: :show
    end
  end
end
