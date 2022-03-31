Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
    resources :classroom
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'       # Dashboard
    resources :users          # Professores
    resources :admins         # Administradores
    resources :courses        # Cursos
    resources :topics         # Assunto
    resources :questions      # Questoes
    resources :subjects       # Disciplinas
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :users, :skip => [:registrations]

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
