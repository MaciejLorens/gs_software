class Api::V1::NotifiesController < ::Api::ApiController

  before_action :set_notify, only: [:show]

  def show
    return not_found unless @notify.present?

    render template: 'api/v1/notifies/show'
  end

  private

  def set_notify
    @notify = Notify.find_by(id: params[:id]) || Notify.find_by(pin: params[:pin])
  end

end
