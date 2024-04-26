class AddCategoryIdToDiagnosisQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :diagnosis_questions, :category_id, :integer
  end
end
