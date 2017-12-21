Rails.application.routes.draw do

  root 'home#index'
  ##------ STATIC ROUTES------------------------------------------------------------- ##
  #
  get 'about-us' => 'home#about_us', :as => :about_us
  get 'privacy-policy' => 'home#privacy_policy', :as => :privacy_policy
  #
  ##------ END STATIC ROUTES-------------------------------------------------------------##




  ##------FRONTEND ROUTES--------------------------------------------------------##
  #
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords'
  }

  get 'profile' => 'home#profile', :as => :my_profile
  get '/get-organizations-from-school/:school_id', to: 'home#get_organizations_from_school', :as => :get_organizations_from_school

  #
  ##------END FRONTEND ROUTES--------------------------------------------------------##




  ##------ ADMIN ROUTES-------------------------------------------------------------##
  #
  namespace :admin, :as => nil do
    get '/get-state-from-country/:country_id', to: 'admin#get_state_from_country', :as => :get_state_from_country
    get '/search-all', to: 'home#search_all', :as => :search_all
    get '/' => 'home#index', :as => :home_admin

    resources :users

    resources :airports

    resources :schools do
      resources :organizations
    end
  end
  #
  ## --------END ADMIN ---------------------------------------------------------------##
end
