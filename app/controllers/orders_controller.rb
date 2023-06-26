class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = ""  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @order.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_number, :area, :city_name, :banchi, :build_name, :phone_number, :order).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end
