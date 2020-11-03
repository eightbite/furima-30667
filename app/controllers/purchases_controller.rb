class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  def index
    @form = Form.new
  end

  def create
    @form = Form.new(purchase_params)  
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:form).permit(:postal_code, :area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if user_signed_in? && @item.purchase.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
