class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def accept
    @booking.accept = true
    if @booking.save
      redirect_to owner_bookings_path
    else
      # Add error alert
    end
  end

  def refuse
    @booking.refuse = false
    if @booking.save
      redirect_to owner_bookings_path
    else
      # Add error alert
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end