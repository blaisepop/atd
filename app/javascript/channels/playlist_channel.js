import consumer from "./consumer";
  const tracksContainer = document.getElementById('tracks');
  if (tracksContainer) {
    const id = tracksContainer.dataset.playlistId;
    consumer.subscriptions.create({ channel: "PlaylistChannel", id: id }, {
      received(data) {
          switch(data.action){
          case "vote":
            console.log(data);
            const voteContainer = document.getElementById(`vote-${data.track_id}`);
            voteContainer.innerHTML = data.votes;
            break;
          case "track":
            tracksContainer.insertAdjacentHTML('afterend', data.content);
            break;
        }
      }
    });
  }
