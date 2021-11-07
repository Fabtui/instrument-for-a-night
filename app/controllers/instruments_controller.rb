class InstrumentsController < ApplicationController
  def index
    search = params[:search]
    if search.present?
      if search[:name].present? && search[:instrument_type].blank? && search[:location].blank?
        search_by_name
      elsif search[:name].blank? && search[:instrument_type].present? && search[:location].blank?
        search_by_type
      elsif search[:name].present? && search[:instrument_type].present? && search[:location].blank?
        search_by_name_type
      elsif search[:name].blank? && search[:instrument_type].present? && search[:location].present?
        search_by_type_location
      elsif search[:name].blank? && search[:instrument_type].blank? && search[:location].present?
        search_by_location
      elsif search[:name].present? && search[:instrument_type].blank? && search[:location].present?
        search_by_name_location
      elsif search[:name].present? && search[:instrument_type].present? && search[:location].present?
        search_by_name_type_location
      else
        @instruments = Instrument.all
      end
    else
      @instruments = Instrument.all
    end
    create_markers
  end

  def show
    @instrument = Instrument.find(params[:id])
    marker =
      {
        lat: @instrument.latitude,
        lng: @instrument.longitude
      }
    @markers = []
    @markers.push(marker)
  end

  def owned
    @owned_instruments = Instrument.where(user_id: current_user.id)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.address = current_user.location
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

  def search_by_name_type
    search = params[:search]
    instrument_type = Instrument.type_search(search[:instrument_type])
    instrument_name = Instrument.global_search(search[:name])
    @instruments = (instrument_type & instrument_name)
  end

  def search_by_name
    search = params[:search]
    @instruments = Instrument.global_search(search[:name])
  end

  def search_by_type
    search = params[:search]
    @instruments = Instrument.type_search(search[:instrument_type])
  end

  def search_by_location
    search = params[:search]
    @instruments = Instrument.location_search(search[:location])
  end

  def search_by_type_location
    search = params[:search]
    instrument_type = Instrument.type_search(search[:instrument_type])
    instrument_location = Instrument.location_search(search[:location])
    @instruments = (instrument_type & instrument_location)
  end

  def search_by_name_location
    search = params[:search]
    instrument_name = Instrument.global_search(search[:name])
    instrument_location = Instrument.location_search(search[:location])
    @instruments = (instrument_name & instrument_location)
  end

  def search_by_name_type_location
    search = params[:search]
    instrument_type = Instrument.type_search(search[:instrument_type])
    instrument_name = Instrument.global_search(search[:name])
    instrument_location = Instrument.location_search(search[:location])
    @instruments = (instrument_type & instrument_name & instrument_location)
  end

  def create_markers
    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,
        info_window: render_to_string(partial: "info_window", locals: { instrument: instrument } )
      }
    end
  end
end
