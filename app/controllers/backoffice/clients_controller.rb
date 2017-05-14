class Backoffice::ClientsController < BackofficeController
  before_action :set_client, only: [:edit, :update]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = ClientService.create(params_client)

    if @client.errors.any?
      render :new
    else
      redirect_to backoffice_clients_path, notice: "O Cliente (#{@client.name}) foi salvo com sucesso"
    end
  end

  def edit
  end

  def update
    if @client.update(params_client)
      redirect_to backoffice_clients_path, notice: "O Cliente (#{@client.name}) foi atualizado com sucesso"
    else
      render :new
    end
  end


  private

    def set_client
      @client = Client.find(params[:id])
    end

    def params_client
      params.require(:client).permit(:name)
    end


end
