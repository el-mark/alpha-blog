Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'

  resources :articles

  get '/articles/:id/word', to: 'articles#word', format: 'docx'
end
