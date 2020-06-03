class VotesController < ApplicationController
  def create
    @vote = Vote.where(guest_id: cookies.encrypted[:guest_id]).where(playlist_id: params[:playlist_id]).where(track_id: params[:track_id]).first_or_create

    redirect_to playlist_path(params[:playlist_id])
    authorize @vote
  end
end
