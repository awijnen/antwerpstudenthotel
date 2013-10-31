class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @room_type = params[:room_type]
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:success] = "Reservation complete"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @reservations = Reservation.all
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :name, :surname, :age, :street, :street_nr, :city, :city_zip, :country, :email, :phone, :university, :comment)
    end
end
