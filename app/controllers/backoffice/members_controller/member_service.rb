# frozen_string_literal: true

module Backoffice
  module MembersController
    class MemberService
      attr_accessor :member

      def self.create(params_member)
        @member = Member.new(params_member)

        @member.save! if @member.valid?

        @member
      end
    end
  end
end
