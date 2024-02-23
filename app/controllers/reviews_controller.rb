class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @bookmark = Bookmark.new ## When we render, we are trying to load the show page using these info!! We nee thus to have bookmark for the first form to create a bookmark!!!
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity #Not sure about that show
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
