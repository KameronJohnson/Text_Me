class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @message.to = params[:to]
  end

  def create
    @message = Message.new(message_params)
    @message.save
      flash[:notice] = "Message sent."
        respond_to do |format|
          format.html { redirect_to messages_path }
          format.js
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
        respond_to do |format|
            format.html { redirect_to messages_path }
            format.js
    end
    flash[:notice] = "Message deleted."
  end


private
  def message_params
    params.require(:message).permit(:from, :to, :body)
  end


end
