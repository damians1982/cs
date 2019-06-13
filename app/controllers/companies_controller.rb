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
    #byebug
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
      #TO DO sprawdzić poprzez wyswietlenie czy checkbox dziala
      #PESEL not implemented

      @company.postal_code = @postal
      @company.street = @street
      @company.city = @city
      if(@company.valid?)
        #byebug
        @company.save
        @msg = "Company saved"
      else
        #To jest do dupy ;-)

        puts "putsuje teraz niektore błędy"
        @msg = @company.errors.details
        puts @company.errors.details[:postal_code]
        puts @company.errors.details[:postal_code].class
        puts @company.errors.details[:postal_code].length

        puts @company.errors.details[:nip].class
        puts @company.errors.details[:nip].length

        puts @company.errors.details[:name].class
        puts @company.errors.details[:name].length
      end
    end
  end

  def new2
  end

  def validate_company
    #In @errors1 we store our error messages for the user
    @errors1 = Hash.new
    @errors1 = fillErrorMessages(@errors1)
    a = copyFromForm2Local2()
    result = ctrl_valid(a,@errors1)

    if(result == true)
      render 'saved'
    else
      render 'make_corrections'
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

    #method
    def copyFromForm2Local
      if(params[:id]!=nil)
        byebug
        puts 'copyFromForm2Local cos dla ciebie robi'
        @company = Company.new
        @company.id = params[:id]
        @company.name = params[:n]
        @company.family_name = params[:fn]
        @company.nip = params[:m]
          if(params[:company_type]=='person')
            puts "fajne"
          end
          #Do something about pesel

        @company.postal_code = params[:p]
        @company.city = params[:c]
        @company.street = params[:s]
        return @company
      else
        puts "copyFromForm2Local nic nie moze dla ciebie zrobic"
      end
    end

    def copyFromForm2Local2
      puts 'copyFromForm2Local2 cos dla ciebie robi'
      @company = Company.new
      @company.company_type = params[:company_type]
      @company.id = params[:id]
      @company.name = params[:n]
      @company.family_name = params[:fn]
      @company.nip = params[:m]
        if(params[:company_type]=='person')
          #Zapisać PESEL w miejscu nip
          @company.nip = params[:ps]
          puts "fajne pesel nadpisuje nip"
        end
      @company.postal_code = params[:p]
      @company.city = params[:c]
      @company.street = params[:s]
      return @company
    end

    def ctrl_valid(company,errors)
      if(company.valid?)
        if(params[:company_type]=='company')
          if(params[:m].length==10)
            #Dla firmy nip ma mieć 10 długości
            #byebug
            company.company_type = true
            company.save
            return true
          else
            return false
          end
        elsif(params[:company_type]=='person')
          if(company[:nip].length==11 && (company[:family_name].strip.length) > 0)
            #NIP(PESEL) dla osoby ma dlugosc 11 znakow
            #family_name ma jakąkolwiek wartość
            company.company_type = false
            company.save
            return true
          else
            return false
          end
        else
          return false
        end
      else
        return false
      end
    end

    def fillErrorMessages(messages)
      messages[:name]="Name nie może być puste"
      messages[:family_name]="Jeśli chcesz wprowadzić osobę to pole nie może być puste"
      messages[:nip]="Jeśli chcesz wprowadzić fimę to pole musi mieć dokładnie 10 znaków"
      messages[:pesel]="Jeśli chcesz wprowadzić osobę prywatną to pole musi mieć dokładnie 11 znaków"
      messages[:postal_code]="to pole musi być w formacie dd-ddd, gdzie d jest cyfrą"
      messages[:city]="to pole nie może być puste"
      messages[:street]="to pole nie może być puste"
      return messages
    end

    def copyFromLocal2Persisted(local,persisted)
      persisted.name = local.name
      persisted.nip = local.nip
      persisted.postal_code = local.postal_code
      persisted.city = local.city
      persisted.street = local.street
    end
end
