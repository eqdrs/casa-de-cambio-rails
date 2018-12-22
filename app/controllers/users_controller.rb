class UsersController < ApplicationController
  def index
    @users =User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash.now[:warning] = 'Você deve informar todos os dados do usuário'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else   
      flash.now[:warning] = 'Você deve informar todos os dados do usuário'
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :cpf, :address_id)
  end
end