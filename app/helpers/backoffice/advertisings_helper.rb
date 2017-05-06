module Backoffice::AdvertisingsHelper
  OptionsForStatuses = Struct.new(:id, :description)

  def options_for_status
    options =[]
    Advertising.statuses_i18n.each do |key, value|
      options.push(OptionsForStatuses.new(key, value))
    end

    options
  end

end
