class PlaylistChannel < ApplicationCable::Channel
  def subscribed
    playlist = Playlist.find(params[:id])
    stream_for playlist
  end
end
