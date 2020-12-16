class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_record_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :purchase_record_id).merge(user_id: current_user.id)
  end
end
