Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :patients, shallow: true do
    resources :recommendations, only: [:index]
  end

  resources :consultation_requests, only: [:create], shallow: true do
    resources :recommendations, only: [:create]

  end
  get 'drug', to: 'external_api#fetch_one_drug'
end
