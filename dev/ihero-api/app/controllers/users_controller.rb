class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_request, only: %i[ create ]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.password = encrypt(params[:password])

    if @user.save
      render json: { message: "User was successfully created." }
    else
      internal_error
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: {message: "User was successfully updated"}
    else
      internal_error
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def encrypt(input_string)
      Base64.encode64(input_string)
    end

    def internal_error
      render json: {message: "Internal server error", status: 500}
    end
end
