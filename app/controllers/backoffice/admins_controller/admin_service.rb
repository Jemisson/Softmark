# frozen_string_literal: true

module Backoffice
  module AdminsController
    class AdminService
      attr_accessor :admin

      def self.create(params_admin)
        @admin = Admin.new(params_admin)

        @admin.save! if @admin.valid?

        @admin
      end
    end
  end
end
