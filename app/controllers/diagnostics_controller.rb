class DiagnosticsController < ApplicationController
  def index
    @questions = DiagnosisQuestion.all
  end

  def show
    @question = DiagnosisQuestion.find(params[:id])
    @user_answer = UserAnswer.new
  end

  def show_result
    user_session_id = session[:session_id]
    @results = calculate_results(user_session_id)
  end

  def result
    user_session_id = session[:session_id] || SecureRandom.uuid
    session[:session_id] = user_session_id

    # このセッションIDに紐づく過去の回答を全て削除
    UserAnswer.where(user_session_id:).delete_all

    begin
      if params[:answers].present?
        params[:answers].each do |diagnosis_question_id, value|
          UserAnswer.create!(
            diagnosis_question_id: diagnosis_question_id.to_i,
            answer: value == 'true',
            user_id: current_user&.id,
            user_session_id:
          )
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "回答の保存中にエラーが発生しました: #{e.message}"
      redirect_to diagnostics_path and return # 適切なエラーページにリダイレクト
    end

    redirect_to show_result_diagnostics_path(user_session_id:) # 結果表示用のパス
  end

  private

  def calculate_results(user_session_id)
    answers = UserAnswer.includes(:diagnosis_question).where(user_session_id:)
    result_scores = Hash.new(0)

    # 回答に基づいてスコアを計算
    answers.each do |answer|
      points = answer.diagnosis_question.points
      next unless answer.answer

      points.each do |result_key, point|
        result_scores[result_key] += point
      end
    end

    # 最もスコアが高い診断結果を選択
    max_score = result_scores.values.max
    best_results = result_scores.select { |_, score| score == max_score }.keys
    best_result_key = best_results.sample
    best_result = DiagnosisResult.find_by(key: best_result_key)

    if best_result
      { name: best_result.result_text, description: best_result.try(:description) }
    else
      { name: '結果がありませんでした。' }
    end
  end
end
