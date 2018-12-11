class CompaniesController < ApplicationController

  before_action :authorize_super_admin

  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all.visible
                   .where(filter_query)
                   .order(sorting_query)
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: t('company.company_was_successfully_created')
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: t('company.company_was_successfully_edited')
    else
      render :edit
    end
  end

  def destroy
    @company.hide!

    redirect_to companies_url, notice: t('company.company_was_successfully_deleted')
  end

  def batch_destroy
    @companies = Company.where(id: params[:ids])
    @companies.each { |company| company.hide! }

    redirect_to companies_url, notice: t('company.companys_was_successfully_deleted')
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :address,
      :postcode,
      :city,
      :country,
      :email
    )
  end

end
