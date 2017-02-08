class ReviewsController < ApplicationController
  def create
    @mixtape = Mixtape.find(params[:mixtape_id])
    @review = @mixtape.reviews.new(review_params)
    if @review.save
      redirect_to mixtape_path(@mixtape)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:content)
  end
end
