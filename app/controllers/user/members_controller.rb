# frozen_string_literal: true

module User
  class MembersController < UserController

    def index
      @clients = Client.all
    end

  end
end
