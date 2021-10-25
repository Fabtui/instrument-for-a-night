class RentsController < ApplicationController
  def index
    @rents = Rent.all
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
    if @rent.save
      redirect_to instruments_path
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
      redirect_to rents_owned_path
    else
      render :edit
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    redirect_to rents_owned_path
  end

  private

  def rent_params
    params.require(:rent).permit(:id, :start_time, :end_time)
  end
end
