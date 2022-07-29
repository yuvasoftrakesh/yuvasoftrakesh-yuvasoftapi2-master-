class Api::V1::CategoriesController < ApplicationController  
  before_action :set_category, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /categories
  def index
    if params[:per] === 'all'
      @categories = Category.all
      render json: {status: 'SUCCESS', message: 'Loaded all categories', code: 200, data: @categories, pagination: {total_entries: "All" }}, status: :ok
    elsif
      @categories = Category.page(params[:page] || 1).per(params[:per_page] || 5)
      render json: {status: 'SUCCESS', message: 'Loaded all categories', code: 200, data: @categories, pagination: { total_pages: @categories.total_pages, total_entries: @categories.total_entries }}, status: :ok
    end
  end

  # GET /categories/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded category', code: 200, data: @category }, status: :ok
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: {status: 'SUCCESS', message: 'Successfully created category', code: 200, data: @category}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create category', code: 400, data: @category}, status: :error
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: {status: 'SUCCESS', message: 'category successfully updated', code: 200, data: @category}, status: :ok
    else
      render json: { error: 'Unable to update category',status:error, code:400}, status: 400
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    render json: {status: 'SUCCESS', message: 'category successfully deleted', code: 200, data: @category}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def not_found
      render json: { error: 'not found', code: 400 }, status: :not_found       
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.permit(:name)
    end
end
