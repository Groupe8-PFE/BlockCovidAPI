class Api::UsersController < ApplicationController
  USERS = [
      'User1',
      'User2',
      'User3',
      'User4'
        ]

  def index
    render json: USERS, status: 200
  end
end