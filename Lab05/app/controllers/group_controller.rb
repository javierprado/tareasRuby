class GroupController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  
  def index
    @groups = Group.all
    respond_with @groups
  end 

  def show
    @group = Group.find(params[:id])
    respond_with @group
  end

  def create
    @name   = params[:group][:name]
    @group  = Group.new(
      {
        :name => @name
      })
    if @group.save
      render "show"
    else
      render "index"
    end 
  end

  def update
    @group = Group.find(params[:group][:id])
    @group.name = params[:group][:name]
    if @group.save
      render "show"
    else
      render "index"
    end 
  end

  def delete
    @group = Group.find(params[:group][:id])
    if @group.destroy
      render "show"
    else
      render "index"
    end 
  end
end
