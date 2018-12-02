class DriversController < ApplicationController
  before_action :authorize_admin

  before_action :set_driver, only: [:edit, :update, :destroy]

  def index
    @drivers = current_company.drivers.visible
                  .order(created_at: :desc)
  end

  def new
    @driver = Driver.new
  end

  def edit
  end

  def create
    @driver = current_company.drivers.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to drivers_path, notice: 'Driver was successfully created.' }
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
        format.html { redirect_to drivers_path, notice: 'Driver was successfully updated.' }
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
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(
      :first_name,
      :last_name,
      :hidden,
      :hidden_at
    )
  end

end
