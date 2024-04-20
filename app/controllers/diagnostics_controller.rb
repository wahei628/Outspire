class DiagnosticsController < ApplicationController
  def index
    @questions = DiagnosisQuestion.all
  end

  def show
    @question = DiagnosisQuestion.find(params[:id])
    @user_answer = UserAnswer.new
  end

  def result
    user_session_id = session[:session_id] || SecureRandom.uuid
    session[:session_id] = user_session_id

    params[:answers].each do |question_id, value|
      UserAnswer.create!(
        question_id: question_id,
        value: value == 'true',
        user_session_id: user_session_id
      )
    end

    calculate_results(user_session_id)
    redirect_to some_path # 結果表示用のパス
  end

  private

  def calculate_results(user_session_id)
    answers = UserAnswer.where(user_session_id: user_session_id)
    # 診断ロジックの実装。各質問のポイントを集計し、最も高いポイントの診断結果を決定。
  end
end
