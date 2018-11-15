Rails.application.routes.draw do
  resources :expenses_sheet, only: [:index, :show, :create] do
    resources :expenses, only: [:create]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "expenses_sheet#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
