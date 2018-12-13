Rails.application.routes.draw do
  resources :categories
  resources :expenses_sheet, only: [:index, :show, :create, :destroy, :edit, :update] do
    resources :expenses, only: [:create, :destroy] do
      get 'claim' #maybe unnecesary anidation, unless want to change expense to another sheet
    end
    resources :asociations, only: [:create]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "expenses_sheet#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
