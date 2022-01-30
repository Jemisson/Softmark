# frozen_string_literal: true

require 'test_helper'

module Backoffice
  class ClientsControllerTest < ActionController::TestCase
    test 'should get index' do
      get :index
      assert_response :success
    end
  end
end
