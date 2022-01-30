# frozen_string_literal: true

module Backoffice
  module QrcodesController
    class QrcodeService

      attr_accessor :qrcode

      def self.create(params_qrcode)
        @qrcode = Qrcode.new(params_qrcode)

        @qrcode.save! if @qrcode.valid?

        @qrcode
      end

    end
  end
end
