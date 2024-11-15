class BookmarksController < ApplicationController
  require "open-uri"

  before_action only: %i[new create destroy]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = movies_fetch
  end

  def create
    @movie_id = params[:bookmark][:movie_id].to_i
    @movies = movies_fetch
    @movie = @movies.values.find {|m|[:id] == @movie_id}
    raise
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def movies_fetch
    url = "https://tmdb.lewagon.com/movie/top_rated"
    result = JSON.parse(URI.parse(url).read)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
