class RegistrationsController < Devise::RegistrationsController

  before_action :set_invitation, only: [:new, :create]


  def new
    unless @invitation.present?
      return redirect_to new_user_session_path, notice: 'Sorry, but your invitation is invalid.'
    end

    super
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

    @invitation.destroy
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation
    ).merge(
       role: @invitation.role,
       company_id: @invitation.company_id
    )
  end

  def set_invitation
    @invitation = Invitation.find_by(token: params[:token])
  end

end
