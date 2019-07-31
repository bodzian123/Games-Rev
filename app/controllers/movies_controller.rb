class MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = Movie.all

    @user_movies = current_user.movies
  end

  def show
    @user_movie = current_user.movies.find(params[:id])
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = current_user.movies.new
  end

  def edit
    @movie = current_user.movies.find(params[:id])
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end

  end

  def update
    @movie = current_user.movies.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = current_user.movies.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :text)
    end
end
