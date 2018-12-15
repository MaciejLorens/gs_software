class NotifiesController < ApplicationController

  before_action :set_notify, only: [:show, :generate_pdf, :edit, :update, :destroy]

  def index
    @notifies = current_notifies
                  .where(filter_query(:created_at))
                  .includes(:client, :product, :user, :driver, :company)
                  .order(sorting_query)
  end

  def show
  end

  def generate_pdf
    html = render template: 'notifies/pdf', layout: 'pdf', locals: { notify: @notify }
    kit = PDFKit.new(html)

    file = kit.to_file("tmp/invoice.pdf")
    send_file file
    # return redirect_to notifies_path, notice: t('notify.notify_pdf_was_successfully_created')
  end

  def new
    @notify = Notify.new
  end

  def edit
  end

  def create
    @notify = current_notifies.new(notify_params)

    if @notify.save
      redirect_to notifies_path, notice: t('notify.notify_was_successfully_created')
    else
      render :new
    end
  end

  def update
    if @notify.update(notify_params)
      redirect_to notifies_path, notice: t('notify.notify_was_successfully_edited')
    else
      render :edit
    end
  end

  def destroy
    @notify.hide!

    redirect_to notifies_url, notice: t('notify.notify_was_successfully_deleted')
  end

  def batch_destroy
    @notifies = Notify.where(id: params[:ids])
    @notifies.each { |notify| notify.hide! }

    redirect_to notifies_url, notice: t('notify.notifys_was_successfully_deleted')
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
      :trailer_number,
      :client_id,
      :product_id,
      :driver_id,
      :expiration_from,
      :indefinite,
      :expiration_to,
      :hidden,
      :hidden_at,
      :active,
      :company_id,
      ).merge(
      user_id: current_user.id,
      client_id: current_user.client_id || params[:notify][:client_id]
    )
  end

end
