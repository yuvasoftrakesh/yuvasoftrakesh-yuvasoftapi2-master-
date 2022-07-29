class Api::V1::TeamsController < ApplicationController  
  before_action :set_team, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /teams
  def index
    if params[:per] === 'all'
      @teams = Team.all
      render json: {status: 'SUCCESS', message: 'Loaded all teams', code: 200, data: @teams, pagination: {total_entries: "All" }}, status: :ok
    elsif
      @teams = Team.page(params[:page] || 1).per(params[:per_page] || 5)
      render json: {status: 'SUCCESS', message: 'Loaded all teams', code: 200, data: @teams, pagination: { total_pages: @teams.total_pages, total_entries: @teams.total_entries }}, status: :ok
    end
  end

  # GET /teams/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded team', code: 200, data: @team }, status: :ok
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: {status: 'SUCCESS', message: 'Successfully created team', code: 200, data: @team}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create team', code: 400, data: @team}, status: :error
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: {status: 'SUCCESS', message: 'team successfully updated', code: 200, data: @team}, status: :ok
    else
      render json: @team
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    render json: {status: 'SUCCESS', message: 'team successfully deleted', code: 200, data: @team}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def not_found
      render json: { error: 'not found', code: 400 }, status: :not_found       
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.permit(:first_name, :last_name, :contact, :email, :designation_id, :description, :image)
    end
end
