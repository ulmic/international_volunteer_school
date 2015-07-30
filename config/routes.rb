Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'web/welcome#index'
  get '/admin' => 'web/admin/welcome#index'
  scope module: :web do
    resource :session, only: [:new, :create, :destroy]
    resources :organizers, only: [ :new, :create ]
    resources :participants, only: [ :new, :create, :index ]
    resources :pages, only: :show
    namespace :admin do
      resources :organizers, except: :show
      resources :participants, except: :show
      resources :pages, except: :show
    end
  end
end
