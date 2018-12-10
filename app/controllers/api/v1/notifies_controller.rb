class Api::V1::NotifiesController < ::Api::ApiController

  before_action :set_notify, only: [:show]

  def show
    render template: 'api/v1/notifies/show'
  end

  private

  def set_notify
    @notify = Notify.find(params[:id]) || Notify.find(params[:pin])
  end

end
