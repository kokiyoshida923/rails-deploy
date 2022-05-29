Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      root to: 'static_pages#home'
      get '/home', to: 'static_pages#home'
      get '/users/:id', to: 'users#show'
    end
  end
end
