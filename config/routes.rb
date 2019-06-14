Rails.application.routes.draw do
  get 'properties/new'
  post 'properties/new'
  get 'properties/edit'
  get 'properties/delete'
  get 'properties/list'
  post 'properties/list'
  get 'properties/save'
  post 'properties/save'
  patch 'properties/edit'
  post 'properties/save_changes'



  root 'invoices_buy#list'
  get 'invoices_buy/list'

  get 'companies/list'
  post 'companies/list'
  get 'companies/new'
  post 'companies/new'
  post 'companies/edit'
  get 'companies/edit'
  patch 'companies/edit'
  post 'companies/delete'
  post 'companies/delete2'

  get 'companies/new2'
  post 'companies/new2'
  get 'companies/validate_company'
  post 'companies/validate_company'
  post 'companies/edit2'

  patch 'companies/update'

  #get 'companies/edit/:id'

  get 'custom', action: :testing, controller: 'invoices_buy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
