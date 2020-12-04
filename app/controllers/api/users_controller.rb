class Api::UsersController < ApplicationController
  USERS = [
      'User1',
      'User2',
      'User3',
      'User4'
        ]

  def index
    @users = User.all()
    render json: @users, status: 200
  end
end