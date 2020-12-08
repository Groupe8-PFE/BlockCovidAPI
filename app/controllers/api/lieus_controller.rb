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

  private
  def lieu_params
    params.require(:lieu).permit(:nom, :description)
  end
end