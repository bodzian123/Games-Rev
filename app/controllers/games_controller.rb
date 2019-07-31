class GamesController < ApplicationController
  before_action :authenticate_user!
  def index
    @games = Game.all
    @user_games = current_user.games
  end

  def show
    @user_game = current_user.games.find(params[:id])
    @game = Game.find(params[:id])
  end

  def new
    @game = current_user.games.new
  end

  def edit
    @game = current_user.games.find(params[:id])
  end

  def create
    @game = current_user.games.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end

  end

  def update
    @game = current_user.games.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = current_user.games.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(:title, :text)
    end
end
