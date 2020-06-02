class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :destroy, :edit, :update]

  def index
    @playlists = Playlist.all

  end

  def new
    @playlist = current_user.playlists.new
    authorize @playlist
  end

  def show
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    authorize @playlist
      if @playlist.save!
        redirect_to playlists_path
      else
        render 'new'
      end
  end

  def update
    @playlist.update(playlist_params)
    redirect_to playlists_path
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end
end
