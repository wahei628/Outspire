class RemoveDiagnosisQuestionIdFromDiagnosisResults < ActiveRecord::Migration[7.1]
  def change
    remove_reference :diagnosis_results, :diagnosis_question, foreign_key: true
  end
end
