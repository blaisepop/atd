import autocomplete from 'autocompleter';
const Spotify = require('spotify-web-api-js');
const s = new Spotify();

const initAutocomplete = () => {
  const input = document.getElementById("track_title");
  const container = document.getElementById("tracks");

  autocomplete({
    input: input,
    minLength:3,
    fetch: function(text, update) {
      console.log(container.dataset.spotifyToken)
      s.setAccessToken(container.dataset.spotifyToken);

      text = text.toLowerCase();
      s.searchTracks(text, { limit: 5 }).then(
        (data) => {
          update(data.tracks.items);
        });
        // you can also use AJAX requests instead of preloaded data
      },
      render: function(item, currentValue) {
        var div = document.createElement("div");
        div.textContent = item.name + " - " + item.artists[0].name
        return div;
      },
      onSelect: function(track) {
        input.value = "";
        const data = {
          track: {
            artist: track.artists[0].name,
            title: track.name,
            album: track.album.name,
            duration: track.duration_ms,
            spotify_uri: track.uri
          }
        }
        fetch(`/playlists/${container.dataset.playlistId}/tracks`, {
          method: "POST",
          headers: {
            'X-CSRF-Token': document.querySelector('[name=csrf-token]').content,
            Accept: 'text/html',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(data)
        });
      }
    });
    };

    export { initAutocomplete };

