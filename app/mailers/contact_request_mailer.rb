class ContactRequestMailer < ActionMailer::Base
  default from: "info@antwerpstudenthotel.com"

  def new_contact_request(contact_request)
    @contact_request = contact_request

    mail to: contact_request.email, subject: "ASH | Contact Request received"
  end
end
