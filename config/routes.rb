Rails.application.routes.draw do

  devise_for :users
  #resources :users
  resources :transactions

  root 'users#index'

  get 'sendmoney', to: "transactions#sendmoney", as: 'send_money'

  get 'view',to: "users#view",as: 'transaction_history'

  get 'credit',to: "transactions#credit",as: 'credit'

  get 'debit',to: "transactions#debit",as: 'debit'

  post 'dotransaction', to: "transactions#mytransaction", as: 'dotransaction'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
