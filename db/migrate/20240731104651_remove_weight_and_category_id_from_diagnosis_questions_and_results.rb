class RemoveWeightAndCategoryIdFromDiagnosisQuestionsAndResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :diagnosis_questions, :weight, :integer
    remove_column :diagnosis_questions, :category_id, :integer
    remove_column :diagnosis_results, :category_id, :integer
    add_column :diagnosis_results, :key, :string
  end
end
