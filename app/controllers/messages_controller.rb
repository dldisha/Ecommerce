class MessagesController < ApplicationController
  before_action :find_conversation

  def index
    @messages = @conversation.messages   #grabing msgs in the convo

    if @messages.length > 10   #done so if msgs length gets long
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    @message = @conversation.messages.new
  end

  def create    
    @message = @conversation.messages.new(message_params)   #in already existing convo
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def new
    @message = @conversation.messages.new
  end



  private

    def message_params
      params.require(:message).permit(:body, :user_id)  #require is strong permit..impo condition
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])   #will find the msgs in the convo saved in the database...will bee coming frm the url
    end
end