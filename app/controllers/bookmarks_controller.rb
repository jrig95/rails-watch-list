class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all

    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to lists_path
  end


#   def destroy
#     @patient = Patient.find(params[:id])
#     @patient.destroy
#     redirect_to '/patients/new', :notice => "Your patient has been deleted"
# end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
