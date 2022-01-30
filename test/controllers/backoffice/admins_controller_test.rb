# frozen_string_literal: true

require 'test_helper'

module Backoffice
  class AdminsControllerTest < ActionController::TestCase
    test 'should get index' do
      get :index
      assert_response :success
    end
  end
end
