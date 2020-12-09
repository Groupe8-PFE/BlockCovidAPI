class Api::ScanLieusController < ApplicationController

  def create
    @scan_lieu = ScanLieu.create(scan_lieu_params)
    if @scan_lieu.save
      render json: @scan_lieu
    else
      render json: {errors: @scan_lieu.errors.full.messages}
    end
  end

  private
  def scan_lieu_params
    params.require(:scan_lieu).permit(:lieu_id, :citoyen_id)
  end


end