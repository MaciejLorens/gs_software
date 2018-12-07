class NotifiesController < ApplicationController

  before_action :set_notify, only: [:show, :edit, :update, :destroy]

  def index
    @notifies = current_notifies.visible
                  .where(filter_query(:created_at))
                  .includes(:product, :user, :driver, :company)
                  .order(sorting_query(:expiration_to))
  end

  def show
  end

  def new
    @notify = Notify.new
  end

  def edit
  end

  def create
    @notify = current_notifies.new(notify_params)

    respond_to do |format|
      if @notify.save
        format.html { redirect_to notifies_path, notice: 'Notify was successfully created.' }
        format.json { render :index, status: :created, location: @notify }
      else
        format.html { render :new }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notify.update(notify_params)
        format.html { redirect_to notifies_path, notice: 'Notify was successfully edited.' }
        format.json { render :index, status: :ok, location: @notify }
      else
        format.html { render :edit }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notify.hide!

    respond_to do |format|
      format.html { redirect_to notifies_url, notice: 'Notify was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @notifies = Notify.where(id: params[:ids])
    @notifies.each { |notify| notify.hide! }

    respond_to do |format|
      format.html { redirect_to notifies_url, notice: 'Notifies was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_notify
    @notify = Notify.find(params[:id])
  end

  def notify_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:notify).permit(
      :number,
      :car_number,
      :semitrailer_number,
      :driver_id,
      :company_id,
      :product_id,
      :expiration_from,
      :indefinite,
      :expiration_to,
      :hidden,
      :hidden_at,
      :active
    ).merge(
      user_id: current_user.id
    )
  end

end
