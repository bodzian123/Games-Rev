class HomeController < ApplicationController
  def index
  end

  def games
    @games = Game.all
  end

  def movies
    @movies = Movie.all
  end

  def musics
    @musics = Music.all
  end
end
