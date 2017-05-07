class Backoffice::AdvertisingsController::AdvertisingService
  attr_accessor :advertising

  def self.create(params_advertising)
    @advertising = Advertising.new(params_advertising)

    if @advertising.valid?
      @advertising.save!
    end

    @advertising
  end
end
