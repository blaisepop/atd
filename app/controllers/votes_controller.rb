class VotesController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @track = Track.find(params[:track_id])
    @vote = Vote.where(guest_id: cookies.encrypted[:guest_id]).where(playlist_id: params[:playlist_id]).where(track_id: params[:track_id]).first_or_create
    PlaylistChannel.broadcast_to(
      @playlist,
      {
        action: 'vote',
        track_id: @track.id,
        votes: @track.votes.where(playlist_id: @playlist.id).size,
        tracks: @playlist.tracks
      }
    )
      authorize @vote
  end
end
