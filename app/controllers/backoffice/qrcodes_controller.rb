class Backoffice::QrcodesController < BackofficeController
  def index
    @qrcodes = Qrcode.all
  end

  def new
    @qrcode = Qrcode.new
  end

  private

    def set_qrcode
      @qrcode = Qrcode.find(params[:id])
    end

    def params_qrcode
      params.require(:qrcode).permit(:date_time, :validity, :value, :client)
    end

end
