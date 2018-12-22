class HomeController < ApplicationController
  def index
    if params[:currency]
      @transactions = Transaction.where(nil)
      filtering_params(params).each do |key, value|
        @transactions = @transactions.public_send(key, value) if value.present?
      end
    else
      @transactions = Transaction.all
    end
  end

  private

  def filtering_params(params)
    params.slice(:currency)
  end

end