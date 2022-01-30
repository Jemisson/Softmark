# frozen_string_literal: true

module Backoffice
  module AdvertisingsController
    class AdvertisingService

      attr_accessor :advertising

      def self.create(params_advertising)
        @advertising = Advertising.new(params_advertising)

        @advertising.save! if @advertising.valid?

        @advertising
      end

    end
  end
end
