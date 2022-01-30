# frozen_string_literal: true

module Backoffice
  class WeathersController < BackofficeController
    before_action :set_weather, only: %i[edit update]

    def index
      @weathers = Weather.all
    end

    def new
      @weather = Weather.new
    end

    def create
      @weather = WeatherService.create(params_weather)

      if @weather.errors.any?
        render :new
      else
        redirect_to backoffice_weathers_path, notice: "O clima #{@weather.description} foi salvo com sucesso!"
      end
    end

    def edit; end

    def update
      if @weather.update(params_weather)
        redirect_to backoffice_weathers_path, notice: "O clima #{@weather.description} foi atualizado com sucesso!"
      else
        render :new
      end
    end

    private

    def set_weather
      @weather = Weather.find(params[:id])
    end

    def params_weather
      params.require(:weather).permit(:description, :min_temp, :max_temp)
    end
  end
end
