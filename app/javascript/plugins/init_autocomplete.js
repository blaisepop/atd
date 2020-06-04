import autocomplete from 'autocompleter';
const Spotify = require('spotify-web-api-js');
const s = new Spotify();
s.setAccessToken('BQCZZh7GEeVbb_5czLC81PmH8W8b2cFKfv5GY66sgt5hRzUxGRd4_bkYgZbhgTnFPAarSZzkv73n3X3vFHEbxird-pQ9dlyGn3LJbj1LMV6vVnH0GJ7rscOvkR1fSNMnBmLHKFHjSxtxew');

const initAutocomplete = () => {
  const input = document.getElementById("track_title");
  console.log(input)
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
      onSelect: function(item) {
        input.value = item.label;
      }
    });
    };


    export { initAutocomplete };
