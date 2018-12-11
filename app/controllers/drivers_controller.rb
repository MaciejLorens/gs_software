class DriversController < ApplicationController

  before_action :authorize_admin, only: [:edit, :update, :destroy, :batch_destroy]

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

    if @driver.save
      redirect_to drivers_path, notice: t('driver.driver_was_successfully_created')
    else
      render :new
    end
  end

  def update
    if @driver.update(driver_params)
      redirect_to drivers_path, notice: t('driver.driver_was_successfully_edited')
    else
      render :edit
    end
  end

  def destroy
    @driver.hide!

    redirect_to drivers_url, notice: t('driver.driver_was_successfully_deleted')
  end

  def batch_destroy
    @drivers = Driver.where(id: params[:ids])
    @drivers.each { |driver| driver.hide! }

    redirect_to drivers_url, notice: t('driver.drivers_was_successfully_deleted')
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
