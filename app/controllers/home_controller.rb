class HomeController < ApplicationController
  def index
  end

  def games
    @games = Game.all
  end

  def game
    @game = Game.find(params[:id])
  end

  def movies
    @movies = Movie.all
  end

  def movie
    @movie = Movie.find(params[:id])
  end

  def musics
    @musics = Music.all
  end

  def music
    @music = Music.find(params[:id])
  end
end
