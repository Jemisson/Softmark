# frozen_string_literal: true

module Backoffice
  module ClientsController
    class ClientService
      attr_accessor :client

      def self.create(params_client)
        @client = Client.new(params_client)

        @client.save! if @client.valid?

        @client
      end
    end
  end
end
