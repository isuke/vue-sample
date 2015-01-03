Rails.application.routes.draw do
  resources :tasks, only: %i(index create), defaults: {format: :json}

  get 'pages/todo' => 'pages#todo', as: 'todo'

  root 'pages#todo'
end
