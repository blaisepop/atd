import autocomplete from 'autocompleter';
const Spotify = require('spotify-web-api-js');
const s = new Spotify();

const initAutocomplete = () => {
  const input = document.getElementById("track_title");
  const container = document.getElementById("tracks");
  const AddSongElement = document.getElementById("track_title");
  if (AddSongElement) {
    autocomplete({
      input:input,
      minLength:3,
      fetch: function(text, update) {
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
        div.id = 'content';
        div.style.padding = "0px 10px";
        div.style.paddingTop = "5px";
        div.style.borderBottom = "1px solid white";
        let h6 = document.createElement('h6');
        h6.textContent = item.name;
        h6.style.fontWeight = "bold";
        h6.style.fontSize = "16px";
        div.appendChild(h6);
        let p = document.createElement('p');
        p.textContent = item.artists[0].name + ' - ' + item.album.name;
        p.style.fontSize = "10px";
        div.appendChild(p);
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
}
export { initAutocomplete };

