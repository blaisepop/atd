class TracksController < ApplicationController
  before_action :set_track, only: %i[destroy edit update]

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @track = Track.new(track_params)
    @track.playlists << @playlist
    #same as @track.playlist_tracks << PlaylistTrack.new(playlist: @playlist)
    authorize @track
    if @track.save!
      redirect_to @playlist
    else
      render 'new'
    end
  end

  def update
    @track.update(track_params)
    redirect_to playlists_path
  end

  def destroy
    @track.destroy
    redirect_to playlists_path
  end

  private

  def track_params
    params.require(:track).permit(:artist, :title, :album, :duration, :votes)
  end

  def set_track
    @track = track.find(params[:id])
  end
end
