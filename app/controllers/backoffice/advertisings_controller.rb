class Backoffice::AdvertisingsController < BackofficeController
  before_action :set_advertising, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:new, :edit]
  before_action :set_weather, only: [:new, :edit]

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

  def destroy
    adv_cli = @advertising.client

    if @advertising.destroy
      redirect_to backoffice_advertisings_path, notice: "O anúncio #{adv_cli} foi excluído com sucesso"
    else
      render :index
    end
  end


  private

    def set_advertising
      @advertising = Advertising.find(params[:id])
    end

    def set_category
      @categories_for_advertising = Category.all
    end

    def set_weather
      @weather_for_advertising = Weather.all
    end

    def params_advertising
      params.require(:advertising).permit(:id, :client, :start_date, :end_date,
                                          :category_id, :weather_id)
    end



end
