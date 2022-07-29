class Api::V1::CareersController < ApplicationController  
  before_action :set_career, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /careers
  def index
    if params[:per] === 'all'
      @careers = Career.all
      render json: {status: 'SUCCESS', message: 'Loaded all careers', code: 200, data: @careers, pagination: {total_entries: "All" }}, status: :ok
    elsif
      @careers = Career.page(params[:page] || 1).per(params[:per_page] || 5)
      render json: {status: 'SUCCESS', message: 'Loaded all careers', code: 200, data: @careers, pagination: { total_pages: @careers.total_pages, total_entries: @careers.total_entries }}, status: :ok
    end
  end

  # GET /careers/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded career', code: 200, data: @career }, status: :ok
  end

  # POST /careers
  def create
    @career = Career.new(career_params)

    if @career.save
      render json: {status: 'SUCCESS', message: 'Successfully created career', code: 200, data: @career}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create career', code: 400, data: @career}, status: :error
    end
  end

  # PATCH/PUT /careers/1
  def update
    if @career.update(career_params)
      render json: {status: 'SUCCESS', message: 'career successfully updated', code: 200, data: @career}, status: :ok
    else
      render json: { error: 'Unable to update career',status:error, code:400}, status: 400
    end
  end

  # DELETE /careers/1
  def destroy
    @career.destroy
    render json: {status: 'SUCCESS', message: 'career successfully deleted', code: 200, data: @career}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    def not_found
      render json: { error: 'not found', code: 400 }, status: :not_found       
    end

    # Only allow a list of trusted parameters through.
    def career_params
      params.permit(:name, :description, :image)
    end
end
