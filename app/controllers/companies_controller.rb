class CompaniesController < ApplicationController
  def list
    @lista = "lista firm ;-)"
    @companies = Company.all
  end


  def new
    #params[:type] is our radio button
    @type = params[:company_type]

    @name = params[:n]
    @family_name = params[:fn]
    @nip = params[:m]

    #REMEMBER that pesel we save instead of nip
    @pesel = params[:ps]
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
        if(@type=='company')
          @company.company_type = true
        else
          @company.company_type = false
        end
      @company.name = @name
      @company.family_name = @family_name
      @company.nip = @nip
        if(@company.company_type==false)
          @company.nip = @pesel
        end
      # TO DO sprawdzić poprzez wyswietlenie czy checkbox dziala
      #PESEL not implemented

      @company.postal_code = @postal
      @company.street = @street
      @company.city = @city
      if(@company.valid?)
        @company.save
        @msg = "Company saved"
      else
        #To jest do dupy ;-)
        @msg = @company.errors.details
      end
    end
  end

  def edit
    @company = ifUserClickedEdit
    if(isUserClickedSave)
      #TODO - sprawdz czy nowe dane nie sa takie jak stare
      #wyswietl
      #1 - Sciagnij z db rekord o danym
      #2 - porownuj rekord z danymi w formularzu
      #2a - jesli takie same to nie zapisuj (poinformuj uzytkownika)
      #2b - sprawdz, ktore
      @company_db = Company.find_by(id: params[:id])
      @company = copyFromForm2Local
      copyFromLocal2Persisted(@company,@company_db)
    end
  end

  def delete
    #byebug
    @id = params[:id]
    @name = params[:name]
    @info = params[:info]
  end

  def delete2
    @id_delete = params[:id_to_delete]
    @deleted = Company.delete(@id_delete)
  end

  private
    def  ifUserClickedEdit()
      if(params[:id_company]!=nil)
        #TODO handling DB ERROR
        @company = Company.find_by(id: params[:id_company])
      end
    end

    def isUserClickedSave
        if(params[:id]!=nil)
          return true
        else
          return false
        end
    end

    def copyFromForm2Local
      if(params[:id]!=nil)
        @company = Company.new
        @company.id = params[:id]
        @company.name = params[:n]
        @company.nip = params[:m]
        @company.postal_code = params[:p]
        @company.city = params[:c]
        @company.street = params[:s]
        return @company
      end
    end

    def copyFromLocal2Persisted(local,persisted)
      persisted.name = local.name
      persisted.nip = local.nip
      persisted.postal_code = local.postal_code
      persisted.city = local.city
      persisted.street = local.street
    end

end
