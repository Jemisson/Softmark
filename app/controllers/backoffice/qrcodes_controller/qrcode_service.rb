class Backoffice::QrcodesController::QrcodeService
  attr_accessor :qrcode

  def self.create(params_qrcode)
    @qrcode = Qrcode.new(params_qrcode)

    if @qrcode.valid?
      @qrcode.save!
    end

    @qrcode
  end
end
