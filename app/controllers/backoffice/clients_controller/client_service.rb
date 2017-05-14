class Backoffice::ClientsController::ClientService
  attr_accessor :client

  def self.create(params_client)
    @client = Client.new(params_client)

    if @client.valid?
      @client.save!
    end

    @client
  end
end
