class RentsController < ApplicationController
  def index
    @rents = Rent.where(user_id: current_user.id)
  end

  def show
    @rent = Rent.find(params[:id])
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @rents = Rent.where(instrument_id: @instrument.id)
    @rents_dates = @rents.map do |rent|
      {
        from: rent.start_time,
        to:   rent.end_time
      }
    end
    @rent = Rent.new
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @rent = Rent.new(rent_params)
    @rent.user_id = current_user.id
    @rent.instrument_id = @instrument.id
    @rent.total_price = ((@rent.end_time.mjd - @rent.start_time.mjd) + 1) * @rent.instrument.price_per_day
    if @rent.save
      redirect_to user_rents_path(current_user)
    else
      redirect_to :new
    end
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
    @rent = Rent.find(params[:id])
    @rent.update(rent_params)
    if @rent.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    redirect_to user_rents_path(current_user)
  end

  private

  def rent_params
    params.require(:rent).permit(:id, :start_time, :end_time)
  end
end
