class RentsController < ApplicationController
  def index
    @rents = Rent.where(user_id: current_user.id)
    @loans = Rent.where(instrument: Instrument.where(user_id: current_user.id))
    @all_rents = @rents.or(@loans)
  end

  def show
    @rent = Rent.find(params[:id])
    @user = User.find(@rent.user_id)
    @owner = User.find(@rent.instrument.user_id)
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
    if @rent.end_time
      @rent.total_price = ((@rent.end_time.mjd - @rent.start_time.mjd) + 1) * @rent.instrument.price_per_day
    end
    if @rent.save
      @recipient = User.find(@instrument.user_id)
      @user = current_user
      define_conversation(@recipient)
      Message.new.create_auto_message(@user, @recipient, @conversation, @instrument, @rent)
      redirect_to user_rents_path(current_user)
    else
      render :new
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
    @instrument = Instrument.find(@rent.instrument_id)
    @recipient = User.find(@instrument.user_id)
    @user = current_user
    define_conversation(@recipient)
    @rent.destroy
    Message.new.create_auto_cancel_message(@user, @recipient, @conversation, @instrument, @rent)
    redirect_to user_rents_path(current_user)
  end

  def checkout
    @rents = Rent.where(user_id: current_user.id).where(paid: false)
  end

  private

  def rent_params
    params.require(:rent).permit(:id, :start_time, :end_time)
  end

  def define_conversation(recipient)
    if Conversation.between(current_user.id, recipient.id).present?
      @conversation = Conversation.between(current_user.id, @recipient.id).first
    else
      @conversation = Conversation.create!(sender_id: current_user.id, recipient_id: @recipient.id)
    end
  end
end
