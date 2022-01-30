# frozen_string_literal: true

module Backoffice
  class QrcodesController < BackofficeController
    require 'rqrcode'
    before_action :set_qrcode, only: %i[edit update destroy generate download]

    def index
      @qrcodes = Qrcode.all
    end

    def new
      @qrcode = Qrcode.new
    end

    def create
      @qrcode = QrcodeService.create(params_qrcode)

      if @qrcode.errors.any?
        render :new
      else
        redirect_to edit_backoffice_qrcode_path(@qrcode.id), notice: 'Salvo com sucesso!'
      end
    end

    def edit; end

    def update
      if @qrcode.update(params_qrcode)
        redirect_to backoffice_qrcodes_path, notice: 'O Cupom foi atualizado com sucesso'
      else
        render :new
      end
    end

    def destroy
      client_name = @qrcode.client

      if @qrcode.destroy
        redirect_to backoffice_qrcodes_path, notice: "O cupom de #{client_name} foi excluído com sucesso!"
      else
        render :index
      end
    end

    def generate
      generate_qrcode
      redirect_to edit_backoffice_qrcode_path(@qrcode.id)
    end

    def download
      send_file "#{Rails.root}/public#{@qrcode.img_path}",
                filename: 'qrcode.png',
                type: 'image/png'
    end

    private

    def set_qrcode
      @qrcode = Qrcode.find(params[:id])
    end

    def params_qrcode
      params.require(:qrcode).permit(:date_time, :validity, :value, :client, :img_path, :token)
    end

    def generate_qrcode
      img_show = "/qrcodes/#{DateTime.now}.png"
      img_path = "/var/www/softmark/current/public#{img_show}"
      @qr = RQRCode::QRCode.new(@qrcode.token, size: 10)
      png = @qr.to_img
      png.resize(300, 300).save(img_path)
      @qrcode.update(img_path: img_show)
    end
  end
end
