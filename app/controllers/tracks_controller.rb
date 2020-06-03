class TracksController < ApplicationController
  before_action :set_track, only: %i[remove edit update show]

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
    @track.save
    redirect_to playlists_path
  end

  def remove
    @playlist_track = PlaylistTrack.where(playlist_id: params[:playlist_id]).where(track_id: params[:id]).first
    authorize @track
    @playlist_track.destroy
    redirect_to playlist_path(params[:playlist_id])
  end

  private

  def track_params
    params.require(:track).permit(:artist, :title, :album, :duration)
  end

  def set_track
    @track = Track.find(params[:id])
    authorize @track
  end
end
