Rails.application.routes.draw do
  resources :photos
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :posts
  resources :sessions, only: [:create, :new]
end
