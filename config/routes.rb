Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, param: :uuid, :only => [:show, :create] do
        get 'challenges'
      end
      resources :challenges, :only => [:create] do
        get 'details'
      end
      resources :challenge_details, :only => [:show, :create]
    end
  end
end
