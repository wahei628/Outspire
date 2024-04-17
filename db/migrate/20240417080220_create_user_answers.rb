class CreateUserAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_answers do |t|
      t.references :user, foreign_key: true
      t.references :diagnosis_question, foreign_key: true
      t.boolean :answer

      t.timestamps
    end
  end
end
