class Api::CitoyensController < ApplicationController
  def create
    @citoyen = Citoyen.create()
    if @citoyen.save
      render json: @citoyen
    else
      render json: {errors: @citoyen.errors.full_messages}
    end
  end
  def show
    @citoyen = Citoyen.find(params[:id])
    render json: @citoyen
  end

  private

  def citoyen_params
    params.require(:citoyen).permit(:nom,:prenom,:email,:telephone)
  end

end