namespace :db do
  desc "Add admin user"
  task admin_user: :environment do
    User.create!(name: "Admin",
                 email: "info@antwerpstudenthotel.be",
                 password: "ash-password",
                 password_confirmation: "ash-password",
                 admin: true)
    User.create!(name: "Anthony Wijnen",
                 email: "anthony.wijnen@gmail.com",
                 password: "ash-password",
                 password_confirmation: "ash-password",
                 admin: true)
    User.create!(name: "Michel Neven",
                 email: "michel@minesco.be",
                 password: "ash-password",
                 password_confirmation: "ash-password",
                 admin: true)
  end

  desc "Add 5 room types"
  task room_types: :environment do
    RoomType.create!( name: "Type 1",
                      description: "Some really nice and elaborate description of an ASH room. Makes all the little students wet their pants.",
                      rating: 5,
                      shared_room: false,
                      size: 30,
                      furnished: true)
    RoomType.create!( name: "Type 2",
                      description: "Some really nice and elaborate description of an ASH room. Makes all the little students wet their pants.",
                      rating: 5,
                      shared_room: false,
                      size: 30,
                      furnished: true)
    RoomType.create!( name: "Type 3",
                      description: "Some really nice and elaborate description of an ASH room. Makes all the little students wet their pants.",
                      rating: 5,
                      shared_room: false,
                      size: 30,
                      furnished: true)
    RoomType.create!( name: "Type 4",
                      description: "Some really nice and elaborate description of an ASH room. Makes all the little students wet their pants.",
                      rating: 5,
                      shared_room: false,
                      size: 30,
                      furnished: true)
    RoomType.create!( name: "Hotel",
                      description: "Some really nice and elaborate description of an ASH room. Makes all the little students wet their pants.",
                      rating: 5,
                      shared_room: false,
                      size: 30,
                      furnished: true)
  end

  desc "Add 25 reservation types - Run room_types task first"
  task reservation_types: :environment do
    RoomType.all.each do |room_type|
      room_type.reservation_types.create!(  length_type: "day",
                                            start_date: Date.today,
                                            end_date: (Date.today + 1),
                                            price: 199,
                                            quantity: 10,
                                            available: 10,
                                            marketing_msg: "Special Offer",
                                            marketing_color: "Red",
                                            sold_out: false)
      room_type.reservation_types.create!(  length_type: "one_month",
                                            start_date: Date.new(2013,1,1),
                                            end_date: Date.new(2013,2,1),
                                            price: 199,
                                            quantity: 10,
                                            available: 10,
                                            marketing_msg: "Special Offer",
                                            marketing_color: "Red",
                                            sold_out: false)
      room_type.reservation_types.create!(  length_type: "five_month",
                                            start_date: Date.new(2013,1,1),
                                            end_date: Date.new(2013,6,1),
                                            price: 199,
                                            quantity: 10,
                                            available: 10,
                                            marketing_msg: "Special Offer",
                                            marketing_color: "Red",
                                            sold_out: false)
      room_type.reservation_types.create!(  length_type: "ten_month",
                                            start_date: Date.new(2013,1,1),
                                            end_date: Date.new(2013,11,1),
                                            price: 199,
                                            quantity: 10,
                                            available: 10,
                                            marketing_msg: "Special Offer",
                                            marketing_color: "Red",
                                            sold_out: false)
      room_type.reservation_types.create!(  length_type: "twelve_month",
                                            start_date: Date.new(2013,1,1),
                                            end_date: Date.new(2002,1,1),
                                            price: 199,
                                            quantity: 10,
                                            available: 10,
                                            marketing_msg: "Special Offer",
                                            marketing_color: "Red",
                                            sold_out: false)
    end
  end

  desc "Add 1 sample reservations for each reservation type"
  task sample_reservations: :environment do
    ReservationType.all.each do |reservation_type|
      reservation_type.reservations.create!(  start_date: reservation_type.start_date,
                                              end_date: reservation_type.end_date,
                                              name: "Anthony",
                                              surname: "Wijnen",
                                              age: 27,
                                              street: "Kapelsesteenweg",
                                              street_nr: 5,
                                              city: "Brasschaat",
                                              city_zip: 2930,
                                              country: "Belgium",
                                              email: "test@test.org",
                                              phone: "0477777777",
                                              university: "KULeuven",
                                              comment: "This is gonna be awesome!")
    end
  end

  desc "Add 10 sample Q&S entries"
  task sample_questions_answers: :environment do
    10.times do |n|
      Answer.create!(
        question: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore?",
        answer: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore" )
    end
  end

  desc "Add 10 sample Contact Requests"
  task sample_contact_requests: :environment do
    10.times do |n|
      ContactRequest.create!(
        name: "Anthony",
        surname: "Wijnen",
        email: "anthony.wijnen@gmail.com",
        phone: "0488888888",
        country: "Belgium",
        comment: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore?",
        )
    end
  end
end
