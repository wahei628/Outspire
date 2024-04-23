class AddUserSessionIdToUserAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :user_answers, :user_session_id, :string
    add_index :user_answers, :user_session_id
  end
end
