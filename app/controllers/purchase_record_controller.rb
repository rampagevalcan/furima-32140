class PurchaseRecordController < ApplicationController
  
  def index
    @item = item.find(params[:item_id])
  end

  def create
  end
end
