class MusicsController < ApplicationController
  before_action :authenticate_user!
  def index
    @musics = Music.all

    @user_musics = current_user.musics
  end

  def show
    @music = Music.find(params[:id])
    @user_music = current_user.musics.find(params[:id])
  end

  def new
    @music = current_user.musics.new
  end

  def edit
    @music = current_user.musics.find(params[:id])
  end

  def create
    @music = current_user.musics.new(music_params)

    if @music.save
      redirect_to @music
    else
      render 'new'
    end

  end

  def update
    @music = current_user.musics.find(params[:id])

    if @music.update(music_params)
      redirect_to @music
    else
      render 'edit'
    end
  end

  def destroy
    @music = current_user.musics.find(params[:id])
    @music.destroy

    redirect_to musics_path
  end

  private
    def music_params
      params.require(:music).permit(:title, :text)
    end
end
