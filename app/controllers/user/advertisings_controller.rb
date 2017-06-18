class User::AdvertisingsController < ApplicationController
  before_action :setup_weather, only: [:show]
  layout "presentation"
  require "hg/weather"

  def show
    # @ads = Advertising.where(client: params[:id]) # FOR USE WITHOUT HASH
    @ads = Advertising.find_by_sql("
        SELECT *
        FROM advertisings
        WHERE client_id = #{params[:id]}")
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
