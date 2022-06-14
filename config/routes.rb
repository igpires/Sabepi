Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
    resources :classroom
    post 'classroom/create_answer_occurrence', to: 'classroom#create_answer_occurrence', as: 'create_answer_occurrence'
    post 'classroom/create_student', to: 'classroom#create_student', as: 'create_student'
    post 'classroom/session_destroy', to: 'classroom#session_destroy', as: 'session_destroy'
  end
  namespace :users_backoffice do
    get 'welcome/index'

    resources :questions # Questoes

    resources :classrooms   # Salas de Aulas
    get 'classrooms/switch/:id', to: 'classrooms#switch_classroom' # interruptor classroom

    resources :class_occurrences # ocorrencia de Salas de Aulas
    get 'class_occurrences/:classroom_id/show_occurrence/:class_occurrence_id', to: 'class_occurrences#show_occurrence', as: 'show_class_occurrence'
    patch 'class_occurrences/:classroom_id/show_occurrence/:class_occurrence_id', to: 'class_occurrences#change_question', as: 'change_class_occurrence'
  end
  namespace :admins_backoffice do
    get 'welcome/index'       # Dashboard

    resources :users          # Professores

    resources :admins         # Administradores

    resources :courses        # Cursos

    resources :topics         # Assunto

    resources :questions      # Questoes

    resources :subjects    # Disciplinas
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :users, :skip => [:registrations]

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'

  # Endpoint for ajax request
  get 'search/topics_by_subject/:id', to: 'search#topics_by_subject' # Assuntos por Disciplinas

  get 'search/subjects_by_course/:id', to: 'search#subjects_by_course' # Disciplinas por curso

  get 'search/questions_by_topic/:id', to: 'search#questions_by_topic' # Questoes por topico

end
