class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def owned
    @owned_instruments = Instrument.where(user_id: current_user.id)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = current_user.id
    if @instrument.save
      redirect_to instruments_owned_path
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    if @instrument.save
      redirect_to instruments_owned_path
    else
      render :edit
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy

    redirect_to instruments_owned_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:id, :name, :brand, :description, :year, :price_per_day, :for_rent, :instrument_type, photos: [])
  end

end
