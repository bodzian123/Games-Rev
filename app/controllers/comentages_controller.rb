class ComentagesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comentage = @movie.comentages.create(comentage_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comentage = @movie.comentages.find(params[:id])
    @comentage.destroy
    redirect_to movie_path(@movie)
  end

  private
    def comentage_params
      params.require(:comentage).permit(:comenter, :body)
    end
end
