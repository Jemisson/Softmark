# frozen_string_literal: true

module User
  class AdvertisingsController < ApplicationController

    before_action :setup_weather, only: [:show]
    layout 'presentation'
    require 'hg/weather'

    def show
      @cli = Client.find(params[:id])
      @ads = Advertising.find_by_sql("
        SELECT *
        FROM advertisings
        WHERE client_id = #{params[:id]}
        AND start_date <= '#{Time.zone.today}'
        AND end_date >= '#{Time.zone.today}'
        AND weather_id in ( SELECT id FROM weathers w
            WHERE w.max_temp >= '#{@weather.condition.temperature.celsius.to_i}'
            AND   w.min_temp <= '#{@weather.condition.temperature.celsius.to_i}') ")
    end

    private
    def setup_weather
      HG::Weather.setup do |config|
        config.api_key = '73151c61'
        config.locale = 'pt-br'
      end
      HG::Weather.temperature = :celsius
      @weather = HG::Weather.get(woeid: '455912')
    end

  end
end
