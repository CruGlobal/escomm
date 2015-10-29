Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get "/greet" => "messages#greet", :as => 'greet'
    end
  end
end
