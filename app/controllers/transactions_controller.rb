class TransactionsController < ApplicationController
  def index
    (params[:greater_than].present? && params[:less_than].present? && @transactions = Transaction.where(total: params[:greater_than]..params[:less_than])) or
    (params[:greater_than].present? && @transactions = Transaction.where("total >= ?", params[:greater_than])) or
    (params[:less_than].present? && @transactions = Transaction.where("total <= ?", params[:less_than])) or
    @transactions = Transaction.all
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
      flash[:warning] = 'Você deve informar todos os dados da transação'
      redirect_to new_transaction_path
     
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @users = User.all
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      @transaction.set_total
      redirect_to @transaction
    else   
      flash[:warning] = 'Você deve informar todos os dados da transação'
      redirect_to edit_transaction_path(@transaction)
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
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id, :created_at, :greater_than, :less_than)
  end
end