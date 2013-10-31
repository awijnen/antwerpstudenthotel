require "spec_helper"

describe ReservationMailer do
  describe "user_reservation_request" do
    let(:mail) { ReservationMailer.user_reservation_request }

    it "renders the headers" do
      mail.subject.should eq("User reservation request")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "user_reservation_approved" do
    let(:mail) { ReservationMailer.user_reservation_approved }

    it "renders the headers" do
      mail.subject.should eq("User reservation approved")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "admin_reservation_request" do
    let(:mail) { ReservationMailer.admin_reservation_request }

    it "renders the headers" do
      mail.subject.should eq("Admin reservation request")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
