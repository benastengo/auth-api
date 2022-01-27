class UsersController < ApplicationController
  def index
    users = User.all 
    render json: users
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end 
  #I know I shouldnt make an update and destroy function but I did it anyways for the sake of deliberate practice.
  def update
    if current_user
      user = User.find_by(id: params[:id])
      user.name = params[:name] || user.name
      user.email = params[:email] || user.email
      if user.save
        render json: user
      else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
      else
        render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: { message: "User Deleted"}
  end

  def info
    if current_user
      render json: current_user
    else
      render json: {}, status: :unauthorized
    end
    
  end
end
