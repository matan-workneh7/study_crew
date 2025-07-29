class UsersController < ApplicationController  
  def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end  
    end
  
    def show
      user = User.find_by(id: params[:id])
      if user
        render json: user_response(user)
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  
    def update
      user = User.find_by(id: params[:id])
      if user
        user.update(user_params)
        render json: user_response(user)
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  
    def destroy
      user = User.find_by(id: params[:id])
      if user
        user.destroy
        render json: { message: "User deleted" }, status: :ok
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :academic_year)
    end

    def user_response(user)
      {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
        academic_year: user.academic_year,
        created_at: user.created_at,
        updated_at: user.updated_at
      }
    end
  end