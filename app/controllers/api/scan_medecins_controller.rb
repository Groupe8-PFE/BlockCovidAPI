class Api::ScanMedecinsController < ApplicationController
  def create
    #envoyer_notification
    @scan_medecin = ScanMedecin.create(scan_medecin_params)
    @citoyen = Citoyen.find_by(device_id: params[:device_id])
    puts @citoyen
    @scan_medecin.citoyen_id = @citoyen.id
    if @scan_medecin.save
      Citoyen.find_each do |citoyen|
        if citoyen.id != @citoyen.id
          envoyer_notification(citoyen.token_device)
          puts citoyen.token_device
        end
      end
       render json: @scan_medecin
    else
      render json: {errors: @scan_medecin.errors.full_messages}
    end
  end

  private
  def scan_medecin_params
    params.require(:scan_medecin).permit(:medecin_id, :device_id)
  end

  def envoyer_notification(token_device)
    client = Exponent::Push::Client.new
    messages = [{
                    to: token_device,
                    sound: "default",
                    body: "Vous avez été en contact avec une personne infectée !!"
                }]

    # @Deprecated
    # client.publish(messages)

    # MAX 100 messages at a time
    handler = client.send_messages(messages)

    # Array of all errors returned from the API
    # puts handler.errors

    # you probably want to delay calling this because the service might take a few moments to send
    # I would recommend reading the expo documentation regarding delivery delays
    client.verify_deliveries(handler.receipt_ids)
  end

end