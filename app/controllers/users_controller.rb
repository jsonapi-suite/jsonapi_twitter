class UsersController < ApplicationController
  jsonapi do
    allow_filter :id
    allow_filter :name
    allow_filter :email
    allow_filter :name_prefix do |scope, value|
      scope.where(["name LIKE ?", "#{value}%"])
    end

    allow_filter :friend_id do |scope, value|
      scope.joins(:friendships).where(friendships: { friendee_id: value })
    end
  end

  def index
    users = User.all
    render_ams(users)
  end

  def show
    user = jsonapi_scope(User.all).find(params[:id])
    render_ams(user)
  end
end
