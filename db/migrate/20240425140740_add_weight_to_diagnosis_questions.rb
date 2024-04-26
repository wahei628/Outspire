class AddWeightToDiagnosisQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :diagnosis_questions, :weight, :integer, default: 1
  end
end
