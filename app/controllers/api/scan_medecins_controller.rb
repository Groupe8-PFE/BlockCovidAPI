class Api::ScanMedecinsController < ApplicationController
  def create
    fcm_push_notification
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
  def fcm_push_notification
    message = "Vous avez le coronavirus Test Hedi"
    my_key = "AAAA9WcQ3QM:APA91bEXgMqbbmEWtelc-RkJBYSU2plyNvQmbMjZuLCyaQlss3ZaFJvvty8Vkuv51glgmbgt5xpYWteHmzzmdSB_ObKEbCMBCyRHm3dcNXZf_ICA2HGT6jPE5c65F2dYC4JZOaidSCdm"
    fcm_client = FCM.new(my_key) # set your FCM_SERVER_KEY
    options = { priority: 'high',
                data: { message: message},
                notification: {
                    body: message,
                    sound: 'default'
                }
    }
    # A registration ID looks something like: “dAlDYuaPXes:APA91bFEipxfcckxglzRo8N1SmQHqC6g8SWFATWBN9orkwgvTM57kmlFOUYZAmZKb4XGGOOL9wqeYsZHvG7GEgAopVfVupk_gQ2X5Q4Dmf0Cn77nAT6AEJ5jiAQJgJ_LTpC1s64wYBvC”
    Citoyen.find_each do |citoyen|
      puts "Le citoyen ---------> #{citoyen.device_id}"
      response = fcm_client.send(citoyen.device_id, options)
      puts response
    end
  end
end