class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @message.to = params[:to]
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message sent."
      redirect_to messages_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end


private
  def message_params
    params.require(:message).permit(:from, :to, :body)
  end


end
