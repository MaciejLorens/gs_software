class CompaniesController < ApplicationController
  before_action :authorize_super_admin

  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all.visible
                   .where(filter_query)
                   .order(sorting_query(:created_at))
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :index, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :index, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.hide!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @companies = Company.where(id: params[:ids])
    @companies.each { |company| company.hide! }

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Companies was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      :country
    )
  end

end
