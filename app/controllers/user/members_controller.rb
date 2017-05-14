class User::MembersController < UserController
  def index
    @clients = Client.all
  end
end
