class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.new
    render :new
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(transaction_params) 
    if @transaction.valid?
      @transaction.set_total
      redirect_to @transaction
    else
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
    redirect_to root_path(flash[:notice])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end