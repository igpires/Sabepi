Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
    resources :classroom
  end
  namespace :users_backoffice do
    get 'welcome/index'

    resources :questions # Questoes

    resources :classrooms # Salas de Aulas
    get 'classrooms/switch/:id', to: 'classrooms#switch_classroom' # interruptor classroom

    resources :class_occurrences # ocorrencia de Salas de Aulas
  end
  namespace :admins_backoffice do
    get 'welcome/index'       # Dashboard

    resources :users          # Professores

    resources :admins         # Administradores

    resources :courses        # Cursos

    resources :topics         # Assunto
    get 'topics/by_subject/:id', to: 'topics#topics_by_subject' # Assuntos por Disciplinas

    resources :questions      # Questoes

    resources :subjects    # Disciplinas
    get 'subjects/by_course/:id', to: 'subjects#subjects_by_course' # Disciplinas por curso
  
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :users, :skip => [:registrations]

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
