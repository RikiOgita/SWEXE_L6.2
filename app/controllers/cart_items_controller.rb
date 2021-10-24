class CartItemsController < ApplicationController
    def new
        @cart_item = CartItem.new
    end
    def create
        logger.debug "---------------"
        cart = Cart.find_by(id: current_cart.id)
        @cart_item =CartItem.new(qty: params[:cart_item][:qty], cart_id: cart.id)
        if @cart_item.save
            flash[:notice] = 'カートに追加しました'
            redirect_to cart_path
        else 
            render new_cart_item_path
        end
    end
    def destroy
        cart_item = CartItem.find(params[:id])
        if cart_item.destroy
            flash[:notice] = "カートから削除しました"
        end
        redirect_to root_path
    end
end