class CartItemsController < ApplicationController
  include CurrentCart #to update the cart(concerns)
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  
  def index
    @cart_items = CartItem.all
  end

  
  def show
  end

  
  def new
    @cart_item = CartItem.new
  end

  
  def edit
  end


  def create
    seller = Seller.find(params[:seller_id])   #helps to add to the cart through id
    @cart_item = @cart.add_seller(seller) 

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item.cart, notice: 'Added to Cart' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

  
    def cart_item_params
      params.require(:cart_item).permit(:seller_id)
    end
end
