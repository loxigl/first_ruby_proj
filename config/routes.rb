Rails.application.routes.draw do

  resources :patients, only: [:create, :index, :show], shallow: true do
    resources :recommendations, only: [:index]
  end

  resources :consultation_requests, only: [:create], shallow: true do
    resources :recommendations, only: [:create, :index]

  end
  get 'drug', to: 'external_api#fetch_one_drug'
end
