class TrackChannel < ApplicationCable::Channel
  def subscribed
    track = Track.find(params[:id])
    stream_for track
  end
end
