class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.valid?
      redirect_to @address
    else
      flash[:warning] = 'Você deve preencher todos os campos obrigatórios.'
      redirect_to new_address_path
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :neighbourhood, :postal_code, :user_id)
  end
end