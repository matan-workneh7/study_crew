class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  #before_action :authorize_assistant, only: [:index, :destroy]
  #before_action :authorize_user, only: [:show, :update]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    user = User.find_by(id: params[:id])
    if user.nil?
      render json: { error: 'User not found.' }, status: :not_found
    else
      render json: { error: 'Access denied. You can only view your own profile.' }, status: :forbidden
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    render json: { message: 'User was successfully deleted.' }
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      render json: { error: 'User not found.' }, status: :not_found
    end
  end

  def user_params
    # Adjust permitted params as needed
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :academic_year)
  end

  def authorize_assistant
    unless current_user&.assistant?
      render json: { error: 'Access denied. Only assistants can perform this action.' }, status: :forbidden
    end
  end

  def authorize_user
    unless current_user&.assistant? || current_user == @user
      render json: { error: 'Access denied. You can only view or edit your own profile.' }, status: :forbidden
    end
  end
end
