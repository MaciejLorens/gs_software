class UsersController < ApplicationController

  before_action :authorize_admin

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_invitation, only: [:resend, :invitation_destroy]

  def index
    @users = current_users.clients
               .where(filter_query)
               .includes(:company)
               .order(sorting_query(:created_at))
  end

  def invitations
    @invitations = current_invitations.clients
                     .includes(:company)
                     .order(created_at: :desc)
  end

  def new
    @invitation = current_invitations.new
  end

  def edit
  end

  def resend
    @invitation.send_email

    respond_to do |format|
      format.html { redirect_to invitations_users_url, notice: 'Client was successfully invited.' }
      format.json { head :no_content }
    end
  end

  def invite
    @invitation = current_invitations.create(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to invitations_users_path, notice: 'Client was successfully invited.' }
        format.json { render :index, status: :ok, location: @invitation }
      else
        Rails.logger.info "   ===== @invitations.errors.inspect : #{@invitation.errors.inspect}"
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Client was successfully edited.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.hide!

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Client was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def invitation_destroy
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_users_url, notice: 'Invitation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @users = current_users.where(id: params[:ids])
    @users.each { |user| user.hide! }

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Clients was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_users.find(params[:id])
  end

  def set_invitation
    @invitation = current_invitations.find(params[:id])
  end

  def user_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      :company_id
    ).merge(role: 'client')
  end

  def invitation_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:invitation).permit(
      :email,
      :company_id
    ).merge(role: 'client')
  end

end
