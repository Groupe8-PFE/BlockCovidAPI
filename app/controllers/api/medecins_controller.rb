class Api::MedecinsController < ApplicationController
  # POST medecin
  require 'rqrcode'
  require 'json'
  def create

    @adresse = Adresse.create(adresse_params)
    @medecin = Medecin.create(medecin_params)
    @medecin.adresse_id = @adresse.id
    if @medecin.save && @medecin.valid?
      token = JWT.encode({medecin_id: @medecin.id},"test","HS256")
      render json: @medecin
      puts(@medecin)
    else
      render json: {errors: @medecin.errors.full_messages}
    end
  end


  def show

    @medecin = Medecin.find(params[:id])
    @infos = {:id=>@medecin.id, :role=>'Medecin'}
    @qrcode = RQRCode::QRCode.new(@infos.to_json)

    @svg = @qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 6
    )
    if @medecin
      render json: {
          medecin: @medecin,
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

    def medecin_params()

      params.permit(:nom,:prenom,:inami,:email, :telephone, :password)
    end

    def adresse_params
      params.permit(:rue, :ville, :code_postal)
    end


end
