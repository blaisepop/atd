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
