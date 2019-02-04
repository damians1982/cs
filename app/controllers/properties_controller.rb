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
    end
    render "invalid_data"
  end
end
