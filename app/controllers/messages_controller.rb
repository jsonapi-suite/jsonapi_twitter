class MessagesController < ApplicationController
  jsonapi resource: MessageResource

  def index
    messages = Message.all
    render_jsonapi(messages)
  end

  def show
    scope = jsonapi_scope(Message.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end
end
