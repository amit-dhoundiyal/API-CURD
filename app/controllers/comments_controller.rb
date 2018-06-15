class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    redirect_to movies_path(@movie)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
