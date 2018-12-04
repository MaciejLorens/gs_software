class UsersController < ApplicationController
  before_action :authorize_admin

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = current_company.users.clients.visible
               .where(filter_query)
               .order(sorting_query(:created_at)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = current_company.users.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    @users = User.where(id: params[:ids])
    @users.each { |user| user.hide! }

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Users was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation
    )
  end

end
