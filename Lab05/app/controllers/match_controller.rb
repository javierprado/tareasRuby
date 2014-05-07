class MatchController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
    @matchs = Match.all
    respond_with @matchs
  end

  def show
    @match = Match.find(params[:id])
    respond_with @match
  end

  def create
    @date = params[:match][:date]
    @phase = params[:match][:phase]
    @state = params[:match][:state]
    @local_team_id = params[:match][:local_team_id]
    @visit_team_id = params[:match][:visit_team_id]
    @local_goals = params[:match][:local_goals]
    @visit_goals = params[:match][:visit_goals]
    @winner_team_id = params[:match][:winner_team_id]
    @looser_team_id = params[:match][:looser_team_id]
    @draw = params[:match][:draw?]
    @group_id = params[:match][:group_id]
    @stadium_id = params[:match][:stadium_id]
    @match = Match.new(
      {
        :date => @date,
        :phase => @phase,
        :state => @state,
        :local_team_id => @local_team_id,
        :visit_team_id => @visit_team_id,
        :local_goals => @local_goals,
        :visit_goals => @visit_goals,
        :winner_team_id => @winner_team_id,
        :looser_team_id => @looser_team_id,
        :draw? => @draw,
        :group_id => @group_id,
        :stadium_id => @stadium_id
      })
    if match.save
      render "show"
    else
      render "index"
    end
  end

  def update
    @match = find(params[:match][:id])
    @match.date = params[:match][:date]
    @match.phase = params[:match][:phase]
    @match.state = params[:match][:state]
    @match.local_team_id = params[:match][:local_team_id]
    @match.visit_team_id = params[:match][:visit_team_id]
    @match.local_goals = params[:match][:local_goals]
    @match.visit_goals = params[:match][:visit_goals]
    @match.winner_team_id = params[:match][:winner_team_id]
    @match.looser_team_id = params[:match][:looser_team_id]
    @match.draw = params[:match][:draw?]
    @match.group_id = params[:match][:group_id]
    @match.stadium_id = params[:match][:stadium_id]
    if match.save
      render "show"
    else
      render "index"
    end
  end

  def delete
    @match = find(params[:match][:id])
    if @stadium.destroy
      render "show"
    else
      render "index"
    end
  end
end
