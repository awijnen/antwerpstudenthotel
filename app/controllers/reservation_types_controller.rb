class ReservationTypesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def index
    @reservation_types = ReservationType.all
  end

  def new
    @reservation_type = ReservationType.new
  end

  def create
    @reservation_type = ReservationType.new(reservation_type_params)
    if @reservation_type.save
      flash[:success] = "Reservation Type saved"
      redirect_to reservation_types_url
    else
      render 'new'
    end
  end

  def show
    @reservation_type = ReservationType.find(params[:id])
  end

  def edit
    @reservation_type = ReservationType.find(params[:id])
  end

  def update
    @reservation_type = ReservationType.find(params[:id])
    if @reservation_type.update_attributes(reservation_type_params)
      flash[:success] = "Reservation Type Updated"
    else
      flash[:error] = "Failed to update Reservation Type"
    end
    redirect_to reservation_type_url
  end

  def destroy
    @reservation_type = ReservationType.find(params[:id])
    @reservation_type.destroy
    flash[:success] = "Reservation type deleted"
    redirect_to reservation_types_url
  end

  private
    def reservation_type_params
      params.require(:reservation_type).permit(:length_type, :start_date, :end_date, :price, :quantity, :available, :marketing_msg, :marketing_color, :sold_out)
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
