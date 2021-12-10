class MessagesController < ApplicationController

  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entries.nil?
      @room = entries.room
    else
      @room = Room.create
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
    @newmessage = @room.messages.last(1)
    p @newmessage
  end

  def create
    @message = current_user.messages.create(message_params)
    room = @message.room
    @newmessage = room.messages.last(1)
  end

  def destroy
    @message = Message.find(params[:id])
    room =@message.room
    @message.destroy
    @newmessage = room.messages.last(1)
  end

  private
  def message_params
    params.require(:message).permit(:content, :room_id)
  end

end
