class ProductsController < ApplicationController

  before_action :authorize_admin

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = current_products
                  .where(filter_query)
                  .includes(:company)
                  .order(sorting_query('name ASC'))
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_products.new(product_params)

    if @product.save
      redirect_to products_path, notice: t('product.product_was_successfully_created')
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: t('product.product_was_successfully_edited')
    else
      render :edit
    end
  end

  def destroy
    @product.hide!

    redirect_to products_url, notice: t('product.product_was_successfully_deleted')
  end

  def batch_destroy
    @products = Product.where(id: params[:ids])
    @products.each { |product| product.hide! }

    redirect_to products_url, notice: t('product.products_was_successfully_deleted')
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:product).permit(
      :code,
      :name,
      :number,
      :hidden,
      :hidden_at,
      :company_id
    )
  end

end
