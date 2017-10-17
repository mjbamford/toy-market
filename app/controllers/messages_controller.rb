class MessagesController < ApplicationController
  MESSAGE_PERMITTED_PARAMS = %i[ recipient_id text ]

  def index
    @messages = current_user.message_roots
  end

  def show
    @message = Message.find params[:id]
  end

  def new
    recipient = User.find params[:recipient_id]
    parent = Message.find_by id: params[:parent_id]
    @message = current_user.sent_messages.new recipient: recipient, parent: parent
  end

  def create
    @message = current_user.sent_messages.new message_params
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit MESSAGE_PERMITTED_PARAMS
  end
end
