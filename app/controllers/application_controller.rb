class ApplicationController < ActionController::Base

  include QueryHelper

  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token, only: [:batch_destroy]

  attr_accessor :current_company

  protected

  def super_admin?
    current_user&.super_admin?
  end

  def admin?
    current_user && (current_user.super_admin? || current_user.admin?)
  end

  def current_company
    @current_company || current_user.company
  end

  def current_notifies
    @current_notifies = if super_admin?
                          Notify.all
                        elsif admin?
                          current_company.notifies.visible
                        else
                          current_user.client.notifies.visible
                        end
  end

  def current_clients
    @current_clients = if super_admin?
                         Client.all.order(:name)
                       else
                         current_company.clients.visible.order(:name)
                       end
  end

  def current_drivers
    @current_drivers = if super_admin?
                         Driver.all.order(:last_name)
                       elsif admin?
                         current_company.drivers.visible.order(:last_name)
                       else
                         current_user.client.drivers.visible.order(:last_name)
                       end
  end

  def current_products
    @current_products = if super_admin?
                          Product.all.order(:name)
                        else
                          current_company.products.visible.order(:name)
                        end
  end

  def current_users
    @current_users = if super_admin?
                       User.all
                     elsif admin?
                       current_company.users.visible
                     else
                       current_user.client.users.visible
                     end
  end

  def current_invitations
    @current_invitations = super_admin? ? Invitation.all : current_company.invitations
  end

  def authorize_super_admin
    unless super_admin?
      redirect_to(root_path)
    end
  end

  def authorize_admin
    unless admin?
      redirect_to(root_path)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :token])
  end

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  helper_method :current_company, :current_notifies, :current_clients,
                :current_drivers, :current_products, :current_users,
                :current_invitations, :super_admin?, :admin?
end
