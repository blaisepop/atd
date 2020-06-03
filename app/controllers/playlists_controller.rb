class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :destroy, :edit, :update]


  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = current_user.playlists.new
    authorize @playlist
  end

  def search
    if params[:query].present?
      @playlist = Playlist.where(room_code: params[:query]).first
      #authorize @playlist unless @playlist.nil?
      if @playlist
        authorize @playlist
        redirect_to playlist_path(@playlist.id)
      else
        flash[:alert] = "The code you entered does not exist, please ty again."
        redirect_to root_path
      end
    else
        flash[:alert] = "You have not entered a code."
        redirect_to root_path
    end
  end

  def show
  end

  def new
    @playlist = current_user.playlists.new
    @random_num = rand.to_s[2..8]
    @playlist.room_code = @random_num
    authorize @playlist
    @playlist.save!
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
    params.require(:playlist).permit(:name, :room_code)
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end
  
end
