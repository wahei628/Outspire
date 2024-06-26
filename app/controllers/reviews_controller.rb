class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to reviews_path, notice: 'レビュー作成！'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path, notice: 'レビュー更新！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.destroy
      redirect_to reviews_path, notice: 'レビュー削除！'
    else
      redirect_to reviews_path, alert: 'レビュー削除に失敗しました。', status: :see_other
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to reviews_path, alert: '権限がありません' if @review.nil?
  end

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
