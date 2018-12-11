module NotifiesHelper

  def index_action?
    controller.action_name == 'index'
  end

  def new_action?
    controller.action_name == 'new'
  end

  def show_action?
    controller.action_name == 'show'
  end

  def edit_action?
    controller.action_name == 'edit'
  end


  def index_active?
    controller.action_name == 'index' ? 'active' : ''
  end

  def invitations_active?
    controller.action_name == 'invitations' ? 'active' : ''
  end

  def new_active?
    controller.action_name == 'new' ? 'active' : ''
  end

  def show_active?
    controller.action_name == 'show' ? 'active' : ''
  end

  def edit_active?
    controller.action_name == 'edit' ? 'active' : ''
  end

  def options_for_clients
    current_clients.map do |client|
      [client.name, client.id]
    end
  end

  def options_for_products
    current_products.map do |product|
      ["#{product.name} (#{product.code})", product.id]
    end
  end

  def options_for_drivers
    current_drivers.map do |driver|
      [driver.full_name, driver.id]
    end
  end

  def options_for_users
    current_users.map do |user|
      [user.full_name, user.id]
    end
  end

  def options_for_active
    [
      [t('common.active'), true],
      [t('common.inactive'), false],
    ]
  end

  def options_for_hidden
    [
      [t('common.visible'), false],
      [t('common.hidden'), true],
    ]
  end

  def options_for_indefinite
    [
      [t('common.indefinite'), true],
      [t('common.finite'), false],
    ]
  end

  def options_for_companies
    Company.visible.map do |company|
      [company.name, company.id]
    end
  end

end
