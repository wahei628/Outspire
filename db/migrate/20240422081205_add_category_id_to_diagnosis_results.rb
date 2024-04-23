class AddCategoryIdToDiagnosisResults < ActiveRecord::Migration[7.1]
  def change
    add_column :diagnosis_results, :category_id, :integer
  end
end
