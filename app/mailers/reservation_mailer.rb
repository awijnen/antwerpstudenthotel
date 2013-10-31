class ReservationMailer < ActionMailer::Base
  default from: "info@antwerpstudenthotel.com"

  
  def user_reservation_request(reservation)
    @reservation = reservation

    mail to: reservation.email, subject: "ASH | Reservation request received"
  end

  
  def user_reservation_approved(reservation)
    @reservation = reservation

    mail to: reservation.email, subject: "ASH | Reservation approved"
  end

  
  def admin_reservation_request(reservation)
    @reservation = reservation

    mail to: "anthony.wijnen@gmail.com", subject: "Reservation requested"
  end
end
