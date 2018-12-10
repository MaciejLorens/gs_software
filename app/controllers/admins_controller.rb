class AdminsController < ApplicationController

  before_action :authorize_super_admin

  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :set_invitation, only: [:resend, :invitation_destroy]

  def index
    @admins = User.admins.visible
                .where(filter_query)
                .includes(:company)
                .order(sorting_query(:created_at))
  end

  def invitations
    @invitations = Invitation.all.admins
                     .includes(:company)
                     .order(sorting_query(:created_at))
  end

  def new
    @invitation = Invitation.new
  end

  def edit
  end

  def resend
    @invitation.send_email

    respond_to do |format|
      format.html { redirect_to invitations_admins_url, notice: t('admin.admin_was_successfully_invited') }
      format.json { head :no_content }
    end
  end

  def invite
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to invitations_admins_path, notice: t('admin.admin_was_successfully_invited') }
        format.json { render :index, status: :ok, location: @invitation }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_path, notice: t('admin.admin_was_successfully_edited') }
        format.json { render :index, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.hide!

    respond_to do |format|
      format.html { redirect_to admins_url, notice: t('admin.admin_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  def invitation_destroy
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_admins_url, notice: t('user.invitation_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @admins = User.admins.where(id: params[:ids])
    @admins.each { |admin| admin.hide! }

    respond_to do |format|
      format.html { redirect_to admins_url, notice: t('admin.admins_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  private

  def set_admin
    @admin = User.admins.find(params[:id])
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def admin_params
    # === TODO:Maciej: merge company_id only if super_admin?
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      :company_id
    ).merge(role: 'admin')
  end

  def invitation_params
    params.require(:invitation).permit(
      :email,
      :company_id
    ).merge(role: 'admin')
  end

end
