class OpinionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @music = Music.find(params[:music_id])
    @opinion = @music.opinions.create(opinion_params)
    redirect_to music_path(@music)
  end

  def destroy
    @music = Music.find(params[:music_id])
    @opinion = @music.opinions.find(params[:id])
    @opinion.destroy
    redirect_to music_path(@music)
  end

  private
    def opinion_params
      params.require(:opinion).permit(:commenter, :body)
    end
end
