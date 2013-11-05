class RoomTypesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def index
    @room_types = RoomType.all
  end

  def new
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(room_type_params)
    if @room_type.save
      flash[:success] = "Room type created"
      redirect_to @room_type
    else
      flash[:error] = "Room type creating failed"
      redirect_to 'new'
    end
  end

  def show
    @room_type = RoomType.find(params[:id])
  end

  def edit
    @room_type = RoomType.find(params[:id])
  end

  def update
    @room_type = RoomType.find(params[:id])
    if @room_type.update_attributes(room_type_params)
      flash[:success] = "Room type updated"
      
    else
      flash[:error] = "Failed to update Room type"
    end
    redirect_to @room_type
  end

  def destroy
    @room_type = RoomType.find(params[:id])
    @room_type.destroy
    flash[:success] = "Room type deleted"
    redirect_to room_types_url
  end

  private
    def room_type_params
      params.require(:room_type).permit(:name, :description, :rating, :shared_room, :size, :furnished)
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
