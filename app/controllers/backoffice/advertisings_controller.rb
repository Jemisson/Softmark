# frozen_string_literal: true

module Backoffice
  class AdvertisingsController < BackofficeController

    before_action :set_advertising, only: %i[edit update destroy]
    before_action :set_category, only: %i[new edit]
    before_action :set_weather, only: %i[new edit]
    before_action :set_qrcode, only: %i[new edit]
    before_action :set_client, only: %i[new edit]

    def index
      @advertisings = Advertising.includes(:client).all
    end

    def new
      @advertising = Advertising.new
    end

    def create
      @advertising = AdvertisingService.create(params_advertising)

      if @advertising.errors.any?
        render :new
      else
        redirect_to backoffice_advertisings_path, notice: "#{@advertising.client.name} foi salvo com sucesso"
      end
    end

    def edit; end

    def update
      if @advertising.update(params_advertising)
        redirect_to backoffice_advertisings_path, notice: "#{@advertising.client.name} foi atualizado com sucesso"
      else
        render :new
      end
    end

    def destroy
      adv_cli = @advertising.client.name

      if @advertising.destroy
        redirect_to backoffice_advertisings_path, notice: "O anúncio (#{adv_cli}) foi excluído com sucesso"
      else
        render :index
      end
    end

    private
    def set_advertising
      @advertising = Advertising.find(params[:id])
    end

    def set_category
      @categories_for_advertising = Category.all
    end

    def set_weather
      @weather_for_advertising = Weather.all
    end

    def set_qrcode
      @qrcode_for_advertising = Qrcode.all
    end

    def set_client
      @client_for_advertising = Client.all
    end

    def params_advertising
      params.require(:advertising).permit(:start_date, :end_date, :picture,
                                          :category_id, :weather_id, :qrcode_id,
                                          :client_id)
    end

  end
end
