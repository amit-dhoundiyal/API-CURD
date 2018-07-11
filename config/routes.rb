Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'users#index'
  get '/faq',to: 'users#faq'
  get '/help',to: 'users#help'
  get '/terms_and_conditions',to: 'users#terms_and_condition'
  get '/privacy_policy',to: 'users#privacy_policy'
end
