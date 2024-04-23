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

    if params[:answers].present?
      params[:answers].each do |diagnosis_question_id, value|
        UserAnswer.create!(
          diagnosis_question_id: diagnosis_question_id.to_i,
          answer: value == 'true',
          user_id: current_user.id
        )
      end
    end

    redirect_to show_result_diagnostics_path # 結果表示用のパス
  end

  private

  def calculate_results(user_session_id)
    answers = UserAnswer.includes(:diagnosis_question).where(user_session_id: user_session_id)
    result_scores = Hash.new(0)

    # 各質問に重みを設定
    weights = {
      1 => 2, # 「運動が好きですか？」の質問に重み2を設定
      2 => 1, # その他の質問には基本的に重み1
      # 他の質問にも適宜重みを設定
    }

    # 回答に基づいてスコアを計算
    answers.each do |answer|
      question_weight = answer.diagnosis_question.weight || 1  # データベースから重みを取得、未設定の場合は1を使用
      category_id = answer.diagnosis_question.category_id
      result_scores[category_id] += answer.answer ? question_weight : 0
    end

    # 最もスコアが高いカテゴリを結果として選択
    best_category_id = result_scores.max_by { |_, score| score}&.first
    best_result = DiagnosisResult.find_by(category_id: best_category_id)

    if best_result
      { name: best_result.result_text, description: best_result.try(:description) || "No description available" }
    else
      { name: "No conclusive result", description: "No enough data to determine a result" }
    end
  end
end
