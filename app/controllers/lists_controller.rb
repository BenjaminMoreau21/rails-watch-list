class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
    @avg_rating = @list.reviews.map(&:rating).sum.to_f / @list.reviews.size
    @display_avg_rating = @list.reviews.empty? ? '' : @avg_rating.floor(2)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @lists = List.all
    if @list.save
      redirect_to list_path(@list)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
