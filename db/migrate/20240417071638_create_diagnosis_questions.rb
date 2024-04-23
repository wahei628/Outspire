class CreateDiagnosisQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnosis_questions do |t|
      t.string :question_text

      t.timestamps
    end
  end
end
