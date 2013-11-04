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



  desc "Add 10 sample Q&S entries"
  task populate_questions_answers: :environment do
    10.times do |n|
      Answer.create!(
        question: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore?",
        answer: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore" )
    end
  end

  desc "Add 10 sample Contact Requests"
  task populate_contact_requests: :environment do
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
