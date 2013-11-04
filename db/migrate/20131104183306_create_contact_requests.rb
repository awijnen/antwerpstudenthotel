class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :country
      t.text :comment

      t.timestamps
    end
  end
end
