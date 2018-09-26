class SongsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show

  end

  def new
    @song = Song.new
  end

  def create
      @song = Song.new(strong_params)
      if @song.valid?
        @song.save
        redirect_to @song
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @song.update(strong_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def strong_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_params
    @song = Song.find_by(id: params[:id])
  end


end
