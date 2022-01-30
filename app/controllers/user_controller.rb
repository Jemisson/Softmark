# frozen_string_literal: true

class UserController < ApplicationController

  before_action :authenticate_member!
  layout 'user_member'

end
