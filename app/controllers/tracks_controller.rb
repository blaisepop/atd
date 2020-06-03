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
    @track = Track.new(track_params)
    if @track.save!
      redirect_to playlists_path
    else
      render 'new'
    end
  end

  def update
    @track.update(track_params)
    @track.save
    redirect_to playlists_path
  end

  def destroy
    @track.destroy
    redirect_to playlist_path(@playlist)
    authorize @track
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
