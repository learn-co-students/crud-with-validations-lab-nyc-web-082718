class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def create
    @song = Song.create(require_song)
    if @song.id
      redirect_to @song
    else
      render new_song_path
    end
  end

  def update
    @song = Song.find_by(id: params[:id])
    if @song.update(require_song)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  def require_song
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
