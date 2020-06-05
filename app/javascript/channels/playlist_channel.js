import consumer from "./consumer";
  const tracksContainer = document.getElementById('tracks');
  if (tracksContainer) {
    const id = tracksContainer.dataset.playlistId;
    consumer.subscriptions.create({ channel: "PlaylistChannel", id: id }, {
      received(data) {
        data = JSON.parse(data)
        console.log(data.action)
        console.log(data)
        console.log(data["action"])
        switch(data.action){
          case "vote":
            const voteContainer = document.getElementById(`vote-${data.track_id}`);
            voteContainer.innerHTML = data.votes
            break;
          case "track":
            tracksContainer.insertAdjacentHTML('afterbegin', data);
            break;
        }
      }
    });
  }
