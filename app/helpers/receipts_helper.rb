module ReceiptsHelper
  def index_active
    controller.action_name == 'index' ? 'active' : ''
  end

  def new_active
    controller.action_name == 'new' ? 'active' : ''
  end
end
