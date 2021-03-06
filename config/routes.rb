Rails.application.routes.draw do
  get 'maps/index'

  resources :maps, only: :index

  resources :photos
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'posts#index'
  resources :posts
  resources :sessions, only: [:create, :new]
end
