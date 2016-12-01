class MessagesController < ApplicationController
  jsonapi do
    allow_filter :id
    allow_filter :sender_id
    allow_filter :receiver_id
  end

  def index
    messages = Message.all
    render_jsonapi(messages)
  end

  def show
    message = jsonapi_scope(Message.all).find(params[:id])
    render_jsonapi(message)
  end
end
