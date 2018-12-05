class ProductsController < ApplicationController
  before_action :authorize_admin

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = current_products.visible
                  .where(filter_query)
                  .order(sorting_query(:created_at))
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.hide!

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @products = Product.where(id: params[:ids])
    @products.each { |product| product.hide! }

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Products was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:product).permit(
      :name,
      :number,
      :hidden,
      :hidden_at,
      :company_id
    )
  end

end
