class StadiumController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  
  def index
    @stadia = Stadium.all
    respond_with @stadia
  end

  def show
    @stadium = Stadium.find(params[:id])
    respond_with @stadium
  end

  def create
    @name = params[:stadium][:name]
    @city = params[:stadium][:city]
    @construction_date = params[:stadium][:construction_date]
    @capacity = params[:stadium][:capacity]
    @photo = params[:stadium][:photo]
    @stadium = Stadium.new(
      {
        :name => @name,
        :city => @city,
        :construction_date => @construction_date,
        :capacity => @capacity,
        :photo => @photo
      })
    if @stadium.save
      render "show"
    else
      render "index"
    end
  end

  def update
    @stadium = find(params[:stadium][:id])
    @stadium.name = params[:stadium][:name]
    @stadium.city = params[:stadium][:city]
    @stadium.construction_date = params[:stadium][:construction_date]
    @stadium.capacity = params[:stadium][:capacity]
    @stadium.photo = params[:stadium][:photo]
    if @stadium.save
      render "show"
    else
      render "index"
    end
  end

  def delete
    @stadium = Stadium.find(params[:stadium][:id])
    if @stadium.destroy
      render "show"
    else
      render "index"
    end
  end
end
