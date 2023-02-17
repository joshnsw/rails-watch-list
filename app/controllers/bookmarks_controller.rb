class BookmarksController < ApplicationController


  def index
    @bookmarks = Bookmark.all
  end


  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)

    # @movie = Movie.find(bookmarks_params[:movie_id].to_i)
    @bookmark.list = @list
    # @bookmark.movie = @movie

    if @bookmark.save

      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity

    end
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
