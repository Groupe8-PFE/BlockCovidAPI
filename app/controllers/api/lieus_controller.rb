class Api::LieusController < ApplicationController

  def create
    @etablissement = Etablissement.find(params[:etablissement_id])
    @lieu = @etablissement.lieus.create(lieu_params)
    if @lieu.save
      render json: @lieu
    else
      render json: {errors: @lieu.errors.full_messages}
    end
  end

  def index
    @etablissement = Etablissement.find(params[:etablissement_id])
    @lieu = @etablissement.lieus.all()
    render json: @lieu, status: 200
  end

  def show
    @etablissement = Etablissement.find(params[:etablissement_id])
    @lieu = @etablissement.lieus.find(params[:id])
    @infos = {:id=>@lieu.id, :role=>'Lieu'}
    @qrcode = RQRCode::QRCode.new(@infos.to_json)

    @svg = @qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 6
    )
    if @lieu
      render json: {
          medecin: @lieu,
          svg: @svg
      }
    else
      render json: {
          status: 500,
          errors: ['medecin not found']
      }
    end
  end

  private
  def lieu_params
    params.require(:lieu).permit(:nom, :description)
  end
end