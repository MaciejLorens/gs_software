class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  def index
    @receipts = current_company.receipts.visible
                  .includes(:product, :user, :driver)
                  .order(expiration_to: :desc)
  end

  def show
  end

  def new
    @receipt = Receipt.new
  end

  def edit
  end

  def create
    @receipt = current_company.receipts.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render :index, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { render :index, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @receipt.hide!

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(
      :number,
      :car_number,
      :semitrailer_number,
      :driver_id,
      :company_id,
      :product_id,
      :expiration_from,
      :expiration_to,
      :hidden,
      :hidden_at
    ).merge(
      user_id: current_user.id
    )
  end

end
