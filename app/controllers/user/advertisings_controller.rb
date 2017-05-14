class User::AdvertisingsController < ApplicationController
  layout "application"

  def show
    @ads = Advertising.where(client: params[:id])
  end
end
