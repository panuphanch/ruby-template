class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def change_password
    if @user.update user_password_params
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
    end
    redirect_to edit_user_path(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      @user = user_params
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
  
end
