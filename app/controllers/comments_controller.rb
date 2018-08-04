class CommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :destroy]
  


  def create
     @seller = Seller.find(params[:seller_id])
     @comment = @seller.comments.create(params[:comment].permit(:name, :body))
     redirect_to seller_path(@seller)
  end


  def destroy
  	@seller = Seller.find(params[:seller_id])
  	@comment = @seller.comments.find(params[:id])
  	@comment.destroy
  	redirect_to seller_path(@seller)

  end

  


end
