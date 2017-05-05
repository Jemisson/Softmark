class Backoffice::WeathersController::WeatherService
  attr_accessor :weather

  def self.create(params_weather)
    @weather = Weather.new(params_weather)

    if @weather.valid?
      @weather.save!
    end

    @weather
  end
end
