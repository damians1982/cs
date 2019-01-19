Rails.application.routes.draw do\
  root 'invoices_buy#list'
  get 'invoices_buy/list'
  get 'companies/list'
  get 'companies/new'
  post 'companies/new'
  post 'companies/edit'
  get 'companies/edit'
  patch 'companies/edit'

  #get 'companies/edit/:id' 

  get 'custom', action: :testing, controller: 'invoices_buy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
