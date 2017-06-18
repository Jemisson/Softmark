class User::AdvertisingsController < ApplicationController
  before_action :setup_weather, only: [:show]
  layout "presentation"
  require "hg/weather"

  def show
    @ads = Advertising.find_by_sql("
        SELECT *
        FROM advertisings
        WHERE client_id = #{params[:id]}
        AND start_date <= '#{Date.today}'
        AND end_date >= '#{Date.today}'
        AND weather_id in (
            SELECT id
            FROM weathers
            WHERE maxTemp >= '#{@weather.condition.temperature.celsius}'
            AND   minTemp <= '#{@weather.condition.temperature.celsius}') ")
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
