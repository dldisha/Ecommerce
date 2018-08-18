class ConversationsController < ApplicationController

	  before_action :authenticate_user!

  def index
    @users = User.all  #get all the users
    @conversations = Conversation.all  #display all the convo
  end

  def create   #creating new convo between scope
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?    #is convo is existing already..b/w sender and recipient
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first  #will get first convo
    else
      @conversation = Conversation.create!(conversation_params)  #creates new convo if it does not exists
    end
    redirect_to conversation_messages_path(@conversation)   #setting routes
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end