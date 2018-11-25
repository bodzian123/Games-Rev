class MusicsController < ApplicationController

  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def edit
    @music = Music.find(params[:id])
  end

  def create
    @music = Music.new(music_params)

    if @music.save
      redirect_to @music
    else
      render 'new'
    end

  end

  def update
    @music = Music.find(params[:id])

    if @music.update(music_params)
      redirect_to @music
    else
      render 'edit'
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    redirect_to musics_path
  end

  private
    def music_params
      params.require(:music).permit(:title, :text)
    end
end
