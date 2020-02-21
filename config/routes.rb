Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, except: [:destroy, :edit, :update] do
    resources :doses, only: [:new, :create, :index, :destroy]
  end
end
