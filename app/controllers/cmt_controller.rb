class CmtController < ApplicationController

before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user, only: [:destroy]
   
   def create
  	cmt = Cmt.create(
  		content: params[:cmt][:content], 
  		user_id: current_user.id, 
  	
  		)
   	redirect_to root_path
   end
   
   def destroy
  	@cmt.destroy
   	redirect_to root_path
  end
   
   private
   def set_comment
  	@cmt = Cmt.find(params[:id])
  end
   
   def authorize_user
  	if (@cmt.user_id != cmt_user.id)
  		redirect_to root_path
  	end
   end

end
