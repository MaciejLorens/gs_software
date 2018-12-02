module ReceiptsHelper

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

  def new_active?
    controller.action_name == 'new' ? 'active' : ''
  end

  def show_active?
    controller.action_name == 'show' ? 'active' : ''
  end

  def edit_active?
    controller.action_name == 'edit' ? 'active' : ''
  end

  def options_for_products
    current_company.products.visible.map do |product|
      ["#{product.name} (#{product.number})", product.id]
    end
  end

  def options_for_drivers
    current_company.drivers.visible.map do |driver|
      ["#{driver.first_name} #{driver.last_name}", driver.id]
    end
  end

end
