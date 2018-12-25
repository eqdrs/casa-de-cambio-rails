class UsersController < ApplicationController
  def index
    if params[:name]
      @users = User.where("name like ?", "%#{params[:name]}%")
    else
      @users =User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:warning] = 'Você deve informar todos os dados do usuário'
      redirect_to new_user_path
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
      flash[:warning] = 'Você deve informar todos os dados do usuário'
      redirect_to edit_user_path(@user)
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