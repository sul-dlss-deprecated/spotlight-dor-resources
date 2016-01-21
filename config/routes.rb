Spotlight::Dor::Resources::Engine.routes.draw do
  resources :exhibits, path: '/', only: [] do
    resource :dor_harvester, controller: :"spotlight/resources/dor_harvester", only: [:create, :update]
  end
end