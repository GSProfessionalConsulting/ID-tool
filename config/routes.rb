Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # INSTRUCTIONAL DESIGNERS (Course Creators)
  # Full access to create, edit, manage courses
  namespace :designer do
    resources :courses do
      resources :lessons do
        resources :content_blocks
      end
      # Designer-specific actions
      get "preview", to: "courses#preview", as: :preview
      get "export", to: "courses#export", as: :export
      post "publish", to: "courses#publish", as: :publish
    end
  end

  # LEARNERS (Course Viewers)
  # Limited access - only view published courses
  scope "/learn" do
    # Single course URL for learners - no editing capabilities
    get "course/:course_id", to: "learn#course", as: :learn_course
    get "course/:course_id/lesson/:lesson_id", to: "learn#lesson", as: :learn_lesson
    # Optional: Course catalog for learners
    get "catalog", to: "learn#catalog", as: :learn_catalog
  end

  # PUBLIC COURSE SHARING
  # For sharing courses via direct links (no login required)
  scope "/course" do
    get ":course_id", to: "public#course", as: :public_course
    get ":course_id/lesson/:lesson_id", to: "public#lesson", as: :public_lesson
  end

  # Defines the root path route ("/")
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
