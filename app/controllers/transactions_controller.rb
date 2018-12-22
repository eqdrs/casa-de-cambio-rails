class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.new
    render :new
  end

  def new
    @transaction = Transaction.new
    @users = User.all
  end

  def create
    @transaction = Transaction.create(transaction_params) 
    if @transaction.valid?
      @transaction.set_total
      redirect_to @transaction
    else
      flash.now[:warning] = 'Você deve informar todos os dados da transação'
      @users = User.all
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      @transaction.set_total
      redirect_to @transaction
    else   
      flash.now[:warning] = 'Você deve informar todos os dados da transação'
      render :edit
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = Transaction.find(params[:id]) 
    @transaction.destroy
    flash[:notice] = 'Transação apagada com sucesso!'
    redirect_to root_path()
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end
  
end