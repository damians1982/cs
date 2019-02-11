class PropertiesController < ApplicationController
  def new
  end

  def edit
  end

  def delete
  end

  def list
    @properties = Property.all
  end

  def property
  end

  def save
    @property = Property.new
    @property.name = params[:name]
    @property.regnum = params[:regnum]
    @property.info = params[:info]
    if(@property.valid?)
      @property.save
      render "save"
    else
      render "invalid_data"
    end
  end

  def edit
    id = params[:id_property]
    if(id!=nil)
      @property = Property.find_by(id: id)
    else
      @property = Property.new
    end
  end

  def save_changes
    id = params[:id]
    if(id!=nil)
      @property = Property.find_by(id: id)
      @property.name = params[:name]
      @property.regnum = params[:regnum]
      @property.info = params[:info]
      if(@property.valid?)
        @property.save
        render "save_changes"
      else
        render "invalid_changes"
      end
    else
      @property = Property.new
      render "invalid_changes"
    end
    ## TODO:
    # 1 - get record from db by
    # 2 - put data from form into object representing record from
    # 3 - if object is valid => save to db, render save_changes - DONE
    # 4 - else => render invalid_changes, print error messages - NOT FULLY DONE
  end
end
