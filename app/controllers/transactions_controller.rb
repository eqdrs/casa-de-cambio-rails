class TransactionsController < ApplicationController
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

  def show
    @transaction = Transaction.find(params[:id])
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end