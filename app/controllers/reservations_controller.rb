class ReservationsController < ApplicationController
before_action :signed_in_user, only: [:index, :destroy, :toggle_approval]
before_action :admin_user, only: [:index, :destroy, :toggle_approval]

  def new
    @reservation = Reservation.new
    @room_type = params[:room_type]
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      ReservationMailer.user_reservation_request(@reservation).deliver
      ReservationMailer.admin_reservation_request(@reservation).deliver

      flash[:success] = "Reservation request received"
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

  def toggle_approval
    @reservation = Reservation.find(params[:id])
    @reservation.toggle(:approve)
    if @reservation.save
      redirect_to reservations_path
    else
      flash[:error] = "Can not approve"
      redirect_to reservations_path
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :name, :surname, :age, :street, :street_nr, :city, :city_zip, :country, :email, :phone, :university, :comment)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
