class DriversController < ApplicationController
  before_action :authorize_admin

  before_action :set_driver, only: [:edit, :update, :destroy]

  def index
    @drivers = current_drivers
                  .where(filter_query)
                  .includes(:company)
                  .order(sorting_query(:created_at))
  end

  def new
    @driver = Driver.new
  end

  def edit
  end

  def create
    @driver = current_drivers.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to drivers_path, notice: t('driver.driver_was_successfully_created') }
        format.json { render :index, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to drivers_path, notice: t('driver.driver_was_successfully_edited') }
        format.json { render :index, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @driver.hide!

    respond_to do |format|
      format.html { redirect_to drivers_url, notice: t('driver.driver_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @drivers = Driver.where(id: params[:ids])
    @drivers.each { |driver| driver.hide! }

    respond_to do |format|
      format.html { redirect_to drivers_url, notice: t('driver.drivers_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:driver).permit(
      :first_name,
      :last_name,
      :hidden,
      :hidden_at,
      :company_id
    )
  end

end
