class User::AdvertisingsController < ApplicationController
  include User::AdvertisingsHelper
  layout "presentation"


  def show
    # @ads = Advertising.where(client: params[:id]) # FOR USE WITHOUT HASH
    hash = data_clima_tempo
    @ads = Advertising.where(client: params[:id], category_id: ())
  end
end
