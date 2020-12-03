class Api::BearsController < ApplicationController
  BEARS = [
      'Polar Bear',
      'Grizzly Bear',
      'Black Bear',
      'Brown Bear',
      'Kermode Bear',
      'Giant Panda',
      'Sloth Bear']

  def index
    render json: BEARS, status: 200
  end
end