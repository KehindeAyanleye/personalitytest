Personalitytest::Application.routes.draw do
  post "results" => 'home#results', as: "results"
  root :to => 'home#index'
end
