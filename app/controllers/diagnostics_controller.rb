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
            user_id: current_user.id,
            user_session_id: # user_session_idを明示的に設定
          )
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "回答の保存中にエラーが発生しました: #{e.message}"
      reidrect_to diagnosis_path # 適切なエラーページにリダイレクト
    end

    redirect_to show_result_diagnostics_path(user_session_id:) # 結果表示用のパス
  end

  private

  def calculate_results(user_session_id)
    answers = UserAnswer.includes(:diagnosis_question).where(user_session_id:)
    result_scores = Hash.new(0)

    # 回答に基づいてスコアを計算
    answers.each do |answer|
      question_weight = answer.diagnosis_question.weight
      category_id = answer.diagnosis_question.category_id
      result_scores[category_id] += answer.answer ? question_weight : 0
      Rails.logger.info "Answer: #{answer.answer}, Weight: #{question_weight}, " \
                        "Category: #{category_id}, Score: #{result_scores[category_id]}"
    end

    # 最もスコアが高いカテゴリを結果として選択
    best_category_id = result_scores.max_by { |_, score| score }&.first
    Rails.logger.info "Best Category ID: #{best_category_id}"
    best_result = DiagnosisResult.find_by(category_id: best_category_id)

    if best_result
      { name: best_result.result_text, description: best_result.try(:description) }
    else
      { name: '結果がありませんでした。' }
    end
  end
end
