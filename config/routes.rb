Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :reducers, only: [:create, :index]
      get ':token', to: 'reducers#show'
      post 'robot', to: 'helpers#robot'

      match '*path', to: 'helpers#catch_404', via: :all
    end
  end
end
