require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "8b6c9c0fffee42c0a12b2131baa8fcd6", "a22f29d61b7a49dd987baf2b325394c1", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
