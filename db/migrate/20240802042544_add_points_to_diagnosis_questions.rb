class AddPointsToDiagnosisQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :diagnosis_questions, :points, :jsonb, default: {}
  end
end
