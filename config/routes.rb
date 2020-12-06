Rails.application.routes.draw do
  get 'matrix/show'
  root to: 'matrix#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
