class CompaniesController < ApplicationController

  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :company_not_found

  def index
    @companies = Company.all

    respond_to do |format|
      format.html
      format.json {render json: @companies, only: [:id, :name, :location]}
    end
  end

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @company, only: [:id, :name, :location] }
    end
  end

  def new
    authorize_admin
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:name, :location)

    if company_params.values.any?(&:empty?)
      render json: { error: 'Name and location cannot be empty' }, status: :unprocessable_entity
      return
    else
      @company = Company.new(company_params)
      if @company.save
        redirect_to companies_path, notice: 'Company was successfully created.'
      else
        render json: { error: 'Failed to create Company', details: @company.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :location)
  end

  def authorize_admin
    unless current_user&.admin?
      redirect_to companies_path, alert: "You are not authorized to add Companies"
    end
  end

  def company_not_found
    render json: {error: 'Company not found'}, status: :not_found
  end
end
