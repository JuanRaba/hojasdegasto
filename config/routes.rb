Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  resources :expenses_sheet, only: [:index, :show, :create, :destroy, :edit, :update] do
    get 'fullcalendar'
    resources :expenses, only: [:create, :destroy] do
      get 'claim' #maybe unnecesary anidation, unless want to change expense to another sheet
    end
    resources :asociations, only: [:create]
  end
  resources :expenses, only: [:edit, :update]
  devise_for :users, controllers: {
    sessions: 'users/sessions', # acive_admin needs this
    registrations: 'users/registrations'
  }
  get 'landing/index'
  #root to: "expenses_sheet#index"
  root to: "landing#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
