class CreateDiagnosisResults < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnosis_results do |t|
      t.references :diagnosis_question, foreign_key: true
      t.string :result_text

      t.timestamps
    end
  end
end
