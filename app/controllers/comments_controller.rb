class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user.email
    @game = Game.find(params[:game_id])
    @comment = @game.comments.create(comment_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = @game.comments.find(params[:id])
    @comment.destroy
    redirect_to game_path(@game)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
