# frozen_string_literal: true

require 'test_helper'

module Backoffice
  class CouponsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get backoffice_coupons_index_url
      assert_response :success
    end
  end
end
