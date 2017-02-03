class UsersController < ApplicationController
  jsonapi resource: UserResource

  def index
    users = User.all
    render_jsonapi(users)
  end

  def show
    scope = jsonapi_scope(User.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end
end
