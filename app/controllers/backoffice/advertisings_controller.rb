class Backoffice::AdvertisingsController < BackofficeController
  before_action :set_advertising, only: [:edit, :update, :delete]

  def index
    @advertisings = Advertising.all
  end

  def new
    @advertising = Advertising.new
  end

  def create
    @advertising = AdvertisingService.create(params_advertising)

    if @advertising.errors.any?
      render :new
    else
      redirect_to backoffice_advertisings_path, notice: "O anúncio de #{@advertising.client} foi salvo com sucesso"
    end
  end

  def edit
  end

  def update
    if @advertising.update(params_advertising)
      redirect_to backoffice_advertisings_path, notice: "O anúncio de #{@advertising.client} foi atualizado com sucesso"
    else
      render :new
    end
  end


  private

    def set_advertising
      @advertising = advertising.find(params[:id])
    end

    def params_advertising
      params.require(:advertising).permit(:client, :finishDate, :startDate,
                                          :category, :weather, :user, :status)
    end


end
