# frozen_string_literal: true

module Backoffice
  module WeathersController
    class WeatherService
      attr_accessor :weather

      def self.create(params_weather)
        @weather = Weather.new(params_weather)

        @weather.save! if @weather.valid?

        @weather
      end
    end
  end
end
