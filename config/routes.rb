Rails.application.routes.draw do
  get 'gists/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :feedback, only: %i[new create]
  resources :badges, only: :index
    
  resources :tests, only: :index do

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      post :publish, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, shallow: true, only: %i[index]
    resources :badges, shallow: true
  end
end
