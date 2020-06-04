import autocomplete from 'autocompleter';
const Spotify = require('spotify-web-api-js');
const s = new Spotify();
s.setAccessToken('BQAqmmT_EgynPZhyeM_bINsIUsvuKMPenHEuipFfo5dNkHQVv4vY3bvaWozWyBai_pcbW0Fu_5Oqc5mCGMCzvBgrrrGUHqnMDDPTH46g4bsIGXPfn8S1FTNT9sHLeRuh2-Xe5ZV_ZtDkcg');

const initAutocomplete = () => {
  const input = document.getElementById("track_title");
  const container = document.getElementById("tracks");
  autocomplete({
    input: input,
    minLength:3,
    fetch: function(text, update) {
      text = text.toLowerCase();
      s.searchTracks(text, { limit: 5 }).then(
        (data) => {
          console.log('Search by "Love"', data.tracks.items);
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
            duration: track.duration_ms
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
        })
      }
    });
    };


    export { initAutocomplete };

//"/playlists/:playlist_id/tracks(.:format)"
