class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        logger.debug "---------------"
        @product = Product.new(name: params[:product][:name], 
        price: params[:product][:price])
        if @product.save
            flash[:notice] = '商品を登録しました'
            redirect_to root_path
        else 
            render new_product_path
        end
    end
    def destroy
        product = Product.find(params[:id])
        if product.destroy
            flash[:notice] = "商品を削除しました"
        end
        redirect_to root_path
    end
end
