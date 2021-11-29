class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  #before_action :ensure_admin, only: [:index, :show, :edit, :update, :destroy]
  before_action :ensure_authenticated, only: [:index, :edit, :update, :destroy]

  #before_action :authorize_to_edit_user, only: [:index]

  def index

    user = User.find(session[:user_id])
    if(user.role == 'admin')
      @users = User.all.page(params[:page])
    else
      redirect_to(account_path)
    end

  end

  def show
  end

  def new
    @user = User.new
  end



  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update

    #user = User.find(session[:user_id])
    #if(user.id = @user.id)

      respond_to do |format|
        if @user.update(edit_user_params)
          # In this format call, the flash message is being passed directly to
          # redirect_to().  It's a caonvenient way of setting a flash notice or
          # alert without referencing the flash Hash explicitly.
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end

    # else
    #   redirect_to account_path
    # end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "User was successfully deleted"
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :avatar, :password)
    end

    def edit_user_params
      params.require(:user).permit(:email, :name, :avatar, :password, :role)
    end

    def authorize_to_edit_user
      redirect_to(account_path) unless(can_edit?(@user))
    end

    def ensure_admin
      if(current_user.role == 'admin')
        return
      end

      redirect_to account_path
    end

end
