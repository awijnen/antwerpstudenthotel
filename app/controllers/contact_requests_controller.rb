class ContactRequestsController < ApplicationController
  before_action :signed_in_user, only: [:index, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    if @contact_request.save
      ContactRequestMailer.new_contact_request(@contact_request).deliver
      flash[:success] = "Contact request saved."
      redirect_to root_url
    else
      flash[:error] = "Contact request failed to send."
      redirect_to root_url
    end
  end

  def destroy
    @contact_request = ContactRequest.find(params[:id])
    if @contact_request.delete
      flash[:success] = "Contact request deleted"
    else
      flash[:error] = "Contact request couldn't be deleted"
    end
    redirect_to contact_requests_path
  end

  def index
    @contact_requests = ContactRequest.all
  end

  private
    def contact_request_params
      params.require(:contact_request).permit(:name, :surname, :email, :phone, :country, :comment)
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
