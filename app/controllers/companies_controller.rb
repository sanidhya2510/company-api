class CompaniesController < ApplicationController

  before_action :authenticate_user!

  def index
    @companies = Company.all

    respond_to do |format|
      format.html
      format.json {render json: @companies, only: [:name, :location]}
    end
  end

  def new
    authorize_admin
    @company = Company.new
  end

  def create
    authorize_admin
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: 'Company was successfully created.'
    else
      render :new
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
end
