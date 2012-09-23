KevinmcphillipsCa::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "blog#index"

  resources :blog, only: [:index, :show]

  match "bio" => "blocks#bio"
  match "code" => "blocks#code"
  match "resume" => "blocks#resume"
  match "projects" => "blocks#projects"

end
