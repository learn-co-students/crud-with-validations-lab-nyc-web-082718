class SongsController < ApplicationController


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      flash[:error] = @song.errors.full_messages
      render :new
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    )
  end

end
