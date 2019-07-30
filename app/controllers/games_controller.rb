class GamesController < ApplicationController
  before_action :authenticate_user!
  def index
    @games = Game.all

    @user_games = current_user.games
  end

  def show
    @user_game = current_user.game.find(params[:id])
    @game = Game.find(params[:id])
  end

  def new
    @game = User.find(params[:id]).game.new
  end

  def edit
    @game = User.find(params[:id]).game.find(params[:id])
  end

  def create
    @game = User.find(params[:id]).Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end

  end

  def update
    @game = User.find(params[:id]).Game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = User.find(params[:id]).Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(:title, :text)
    end
end
