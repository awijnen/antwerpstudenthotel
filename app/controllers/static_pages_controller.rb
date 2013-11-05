class StaticPagesController < ApplicationController
  def home
    @answers = Answer.all
    @contact_request = ContactRequest.new
    @room_types = RoomType.all
    @reservation_types = ReservationType.all
  end

  def about
  end

  def contact
  end

  def questions_answers
  end

  def partners
  end

  def student_story
  end
end
