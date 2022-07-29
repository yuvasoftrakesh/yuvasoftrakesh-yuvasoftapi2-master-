class Api::V1::DesignationsController < ApplicationController  
  before_action :set_designation, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /designations
  def index
    if params[:per] === 'all'
      @designations = Designation.all
      render json: {status: 'SUCCESS', message: 'Loaded all designations', code: 200, data: @designations, pagination: {total_entries: "All" }}, status: :ok
    elsif
      @designations = Designation.page(params[:page] || 1).per(params[:per_page] || 5)
      render json: {status: 'SUCCESS', message: 'Loaded all designations', code: 200, data: @designations, pagination: { total_pages: @designations.total_pages, total_entries: @designations.total_entries }}, status: :ok
    end
  end

  # GET /designations/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded designation', code: 200, data: @designation }, status: :ok
  end

  # POST /designations
  def create
    @designation = Designation.new(designation_params)

    if @designation.save
      render json: {status: 'SUCCESS', message: 'Successfully created designation', code: 200, data: @designation}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create designation', code: 400, data: @designation}, status: :error
    end
  end

  # PATCH/PUT /designations/1
  def update
    if @designation.update(designation_params)
      render json: {status: 'SUCCESS', message: 'designation successfully updated', code: 200, data: @designation}, status: :ok
    else
      render json: { error: 'Unable to update designation',status:error, code:400}, status: 400
    end
  end

  # DELETE /designations/1
  def destroy
    @designation.destroy
    render json: {status: 'SUCCESS', message: 'designation successfully deleted', code: 200, data: @designation}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designation
      @designation = Designation.find(params[:id])
    end

    def not_found
      render json: { error: 'not found', code: 400 }, status: :not_found       
    end

    # Only allow a list of trusted parameters through.
    def designation_params
      params.permit(:name)
    end
end
