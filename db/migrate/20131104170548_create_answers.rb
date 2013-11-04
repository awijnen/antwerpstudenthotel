class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
