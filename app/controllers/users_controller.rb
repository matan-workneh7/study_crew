class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]
  before_action :authorize_assistant, only: [ :index ]

  # GET /users
  def index
    if current_user&.assistant?
      @users = User.all
    else
      redirect_to root_path, alert: "Access denied. Only assistants can view all users."
    end
  end

  # GET /users/:id
  def show
    unless current_user&.assistant? || current_user == @user
      redirect_to root_path, alert: "Access denied. You can only view your own profile."
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit
    unless current_user&.assistant? || current_user == @user
      redirect_to root_path, alert: "Access denied. You can only edit your own profile."
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    if @user.destroy
      redirect_to users_url, notice: "User was successfully deleted."
    else
      redirect_to @user, alert: "Unable to delete user."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path, alert: "User not found."
  end

  def user_params
    # Allow assistants to update any field, regular users can only update their own basic info
    if current_user&.assistant?
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :academic_year)
    else
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :academic_year)
    end
  end

  def authorize_user
    unless current_user&.assistant? || current_user == @user
      redirect_to root_path, alert: "Access denied."
    end
  end

  def authorize_assistant
    unless current_user&.assistant?
      redirect_to root_path, alert: "Access denied. Only assistants can perform this action."
    end
  end

  # Helper method to get current user (you may need to implement this based on your authentication system)
  def current_user
    # This should be implemented based on your authentication system
    # For example, if using Devise: current_user
    # For now, returning nil - you'll need to implement this
    nil
  end
end
