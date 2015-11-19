Rails.application.routes.draw do
  get 'sessions/new'

  get 'recipients/fname:string' => 'recipients#fname'

  get 'recipients/lname:string' => 'recipients#lname'

  get 'recipients/email:string' => 'recipients#email'

  get 'recipients/new' => 'recipients#new'

  get 'users/fname:string' => 'users#fname'

  get 'users/lname:string' => 'users#lname'

  get 'users/email:string' => 'users#email'

  get 'users/new'  => 'users#new'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get "/greet" => "messages#greet", :as => 'greet'
    end
  end

  get '/auth/key/callback', to: 'tokens#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'monitors/lb' => 'monitors#lb'
end
