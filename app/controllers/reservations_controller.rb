class ReservationsController < ApplicationController
before_action :signed_in_user, only: [:index, :destroy, :toggle_approval]
before_action :admin_user, only: [:index, :destroy, :toggle_approval]

  def new
    @reservation = Reservation.new
    @reservation_type = ReservationType.find(params[:reservation_type_id]) unless params[:reservation_type_id].nil?  
  end

  def create
    @reservation_type = ReservationType.find(params[:reservation_type])
    if @reservation = @reservation_type.reservations.create(reservation_params)
      ReservationMailer.user_reservation_request(@reservation).deliver
      ReservationMailer.admin_reservation_request(@reservation).deliver
      flash[:success] = "Reservation request received"
    else
      flash[:error] = "Reservation request failed"
    end
    
    if signed_in?
      redirect_to reservations_path
    else
      redirect_to root_url
    end
  end

  def index
    @reservations = Reservation.all
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.delete
      flash[:success] = "Reservation deleted"
    else
      flash[:error] = "Reservation couldn't be deleted"
    end
    redirect_to reservations_path
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      flash[:success] = "Reservation updated"
    else
      flash[:error] = "Couldn't update reservation"
    end
    redirect_to reservations_path
  end

  def approval_toggle
    @reservation = Reservation.find(params[:id])
    @reservation.toggle(:approved)
    if @reservation.save
      ReservationMailer.user_reservation_approved(@reservation).deliver
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
