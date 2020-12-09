class Api::ScanMedecinsController < ApplicationController
  def create
    @scan_medecin = ScanMedecin.create(scan_medecin_params)
    @citoyen = Citoyen.find_by(device_id: params[:device_id])
    puts @citoyen
    @scan_medecin.citoyen_id = @citoyen.id
    if @scan_medecin.save
      render json: @scan_medecin
    else
      render json: {errors: @scan_medecin.errors.full_messages}
    end
  end

  private
  def scan_medecin_params
    params.require(:scan_medecin).permit(:medecin_id, :device_id)
  end
end