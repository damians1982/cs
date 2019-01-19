class CompaniesController < ApplicationController
  def list
    @lista = "lista firm ;-)"
    @companies = Company.all

  end


  def new
    @name = params[:n]
    @nip = params[:m]
    @postal = params[:p]
    @street = params[:s]
    @city = params[:c]
    @buttn =""
    #What we want now?
    #We want to know that this function was invoked by clicking the link_to
    #From other part of program or it was invoked bu submitting save button

    #We know we came here by submit button not by other links
    if(params[:button]=='yes')
      @button = "yes"
      @company = Company.new
      @company.name = @name
      @company.nip = @nip
      @company.postal_code = @postal
      @company.street = @street
      @company.city = @city
      if(@company.valid?)
        @company.save
        @msg = "Company saved"
      else
        @msg = @company.errors.details[:city]
      end
    end
  end

  def edit
    @id = params[:id_company]
    @work = "works"
    @changed_flag ="no"

    @company = Company.find_by(id: params[:id_company])
    #User clicked save button
    if(params[:button]=='yes')

    end
  end
end
