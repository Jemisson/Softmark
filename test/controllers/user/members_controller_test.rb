# frozen_string_literal: true

require 'test_helper'

module User
  class MembersControllerTest < ActionController::TestCase
    test 'should get index' do
      get :index
      assert_response :success
    end
  end
end
