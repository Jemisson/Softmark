class Backoffice::QrcodesController < BackofficeController
  require 'rqrcode'

  def index
    @qrcodes = Qrcode.all
  end

  def new
    @qrcode = Qrcode.new
    generate_qrcode
  end


  def download
    send_file "#{Rails.root}#{@img_path}",
      :filename => "qrcode.png",
      :type => "image/png"
  end


  private

    def set_qrcode
      @qrcode = Qrcode.find(params[:id])
    end

    def params_qrcode
      params.require(:qrcode).permit(:date_time, :validity, :value, :client)
    end

    def generate_qrcode
      @img_show = "/qrcodes/#{DateTime.now()}.png"
      @img_path = "/home/james/Documentos/Mestrado/softmark/public#{@img_show}"
      @qr = RQRCode::QRCode.new('Funfandocap', :size => 10)
      @png = @qr.to_img
      @png.resize(300, 300).save(@img_path)
    end

end
