class TeamController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  
  def index
    @teams = Team.all
    respond_with @teams
  end

  def show
    @team = Team.find(params[:id])
    respond_with @team
  end

  def create
    @name = params[:team][:name]
    @coach = params[:team][:coach]
    @flag = params[:team][:flag]
    @uniform = params[:team][:uniform]
    @info = params[:team][:info]
    @team = Team.new(
      {
        :name => @name,
        :coach => @coach,
        :flag => @flag,
        :uniform => @uniform,
        :info => @info
      })
    if @team.save
      render "show"
    else
      render "index"
    end
  end

  def update
    @team = team.find(params[:team][:id])
    @team.name = params[:team][:name]
    @team.coach = params[:team][:coach]
    @team.flag = params[:team][:flag]
    @team.uniform = params[:team][:uniform]
    @team.info = params[:team][:info]
    if @team.save
      render "show"
    else
      render "index"
    end
  end

  def delete
    @team = Team.find(params[:team][:id])
    if @team.destroy
      render "show"
    else
      render "index"
    end
  end
end
