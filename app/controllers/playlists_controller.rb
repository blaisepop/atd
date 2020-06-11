require 'uri'
require 'net/http'

class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :destroy, :edit, :update, :create_spotify]

  def index
    @playlists = current_user.playlists
  end

  def search
    if params[:query].present?
      @playlist = Playlist.where(room_code: params[:query]).first
      #authorize @playlist unless @playlist.nil?
      if @playlist
        authorize @playlist
        cookies.encrypted[:guest_id] = SecureRandom.uuid
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
    authorize @playlist
    @track = Track.new
    uri = URI('https://accounts.spotify.com/api/token')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request['Authorization'] = (ENV['SPOTIFY_CLIENT_BASIC'])
    request['Content-Type'] = 'application/x-www-form-urlencoded'
    request.body = "grant_type=client_credentials"
    response = https.request(request)
    @token = JSON.parse(response.body)['access_token']
  end

  def new
    @playlist = current_user.playlists.new
    authorize @playlist
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

    @playlist.generate_code
    authorize @playlist
    if @playlist.save
      redirect_to playlists_path
    else
      flash[:alert] = "Please type a name for your playlist."
      render 'new'
    end
  end

  def update
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :room_code, :submission, :date, :seetracks)
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end
end
