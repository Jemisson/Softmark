# frozen_string_literal: true

module Backoffice
  class CouponsController < BackofficeController

    before_action :set_coupon, only: %i[edit update]

    def index
      @coupons = Coupon.all
    end

    def edit; end

    def update
      if @coupon.update(params_coupon)
        redirect_to backoffice_coupons_path, notice: "O Cupom de (#{@coupon.name}) foi baixado com sucesso"
      else
        render :new
      end
    end

    private
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def params_coupon
      params.require(:coupon).permit(:status)
    end

  end
end
